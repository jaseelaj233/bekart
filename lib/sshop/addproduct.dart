import 'package:bekart/shop.dart';
import 'package:bekart/sshop/addpage.dart';
import 'package:bekart/sshop/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  CollectionReference _collectionReferenceShoppingList =
      FirebaseFirestore.instance.collection('products');
  late Stream<QuerySnapshot> _streamProductListItems;

  @override
  void initState() {
    super.initState();
    _streamProductListItems = _collectionReferenceShoppingList.snapshots();
  }

  void _deleteItem(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Item"),
        content: Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                _collectionReferenceShoppingList
                    .doc(docId)
                    .delete()
                    .then((value) => Navigator.of(context).pop())
                    .catchError((error) => print("Failed to delete: $error"));
              },
              child: Text("Delete"))
        ],
      ),
    );
  }

  void _updateItem(String docId, Map<String, dynamic> currentData) {
    // Controllers for input fields
    TextEditingController quantityc =
        TextEditingController(text: currentData['quantity']);
    TextEditingController priceController =
        TextEditingController(text: currentData['price']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Item"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: quantityc,
                decoration: InputDecoration(labelText: 'quantity Product'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'priceProduct'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                // Update the item in Firebase
                _collectionReferenceShoppingList.doc(docId).update({
                  'quantity': quantityc.text,
                  'price': priceController.text,
                }).then((value) {
                  print('Item updated successfully');
                  Navigator.of(context).pop();
                }).catchError((error) => print("Failed to update: $error"));
              },
              child: Text("Update")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 154, 94),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Products',
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          title: const Text('view products'),
          backgroundColor: const Color.fromARGB(255, 191, 154, 94),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Addpage(),
                ));
              },
              child: Text('Add Product'),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _streamProductListItems,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.connectionState == ConnectionState.active) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                  // Mapping Firestore documents to Map<String, dynamic>
                  List<Map<String, dynamic>> items = documents
                      .map((doc) => {
                            'id': doc.id,
                            'shopname': doc['shopname'] ?? 'Name not available',
                            'productname':
                                doc['productname'] ?? 'Product not available',
                            'productimage': doc['productimage'] ?? '',
                            'rating': doc['rating']?.toString() ??
                                'Rating not available',
                            'quantity': doc['quantity']?.toString() ??
                                'quantity not available',
                            'price': doc['price']?.toString() ??
                                'price not available',
                          })
                      .toList();

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> thisItem = items[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              thisItem['productimage'] != ''
                                  ? Image.network(
                                      thisItem['productimage'],
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 100);
                                      },
                                    )
                                  : const Icon(Icons.broken_image, size: 100),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    thisItem['shopname'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    thisItem['rating'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.star, color: Colors.amber),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Center(
                                child: Text(
                                  thisItem['productname'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                thisItem['price'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                thisItem['quantity'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      print(
                                          "Edit button clicked for: ${thisItem['productname']}");
                                      _updateItem(thisItem['id'], thisItem);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () =>
                                        _deleteItem(thisItem['id']),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ]));
  }
}
