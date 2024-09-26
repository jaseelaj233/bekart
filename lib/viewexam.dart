import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataProductFirebase extends StatefulWidget {
  const DataProductFirebase({super.key});

  @override
  State<DataProductFirebase> createState() => _DataProductFirebaseState();
}

class _DataProductFirebaseState extends State<DataProductFirebase> {
  CollectionReference _collectionReferenceShoppingList =
      FirebaseFirestore.instance.collection('products');
  late Stream<QuerySnapshot> _streamProductListItems;

  @override
  void initState() {
    super.initState();
    _streamProductListItems = _collectionReferenceShoppingList.snapshots();
  }

  // Delete item function
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

  // Update item function
  void _updateItem(String docId, Map<String, dynamic> currentData) {
    // Controllers for input fields
    TextEditingController nameController =
        TextEditingController(text: currentData['productname']);
    TextEditingController priceController =
        TextEditingController(text: currentData['price']);
    TextEditingController imageController =
        TextEditingController(text: currentData['productimage']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Item"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name Product'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'priceProduct'),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
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
                  'productname': nameController.text,
                  'price': priceController.text,
                  'productimage': imageController.text
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
      appBar: AppBar(
        title: Text("Data from Firebase Shopping List"),
      ),
      body: StreamBuilder<QuerySnapshot>(
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
                      'productname': doc['productname'] ?? 'Name not available',
                      'price': doc['price'] ?? 'Description not available',
                      'productimage': doc['productimage'] ?? ''
                    } as Map<String, dynamic>)
                .toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> thisItem =
                      items[index]; // Now of type Map<String, dynamic>

                  return ListTile(
                    leading: thisItem['productimage'] != ''
                        ? Image.network(
                            thisItem['productimage'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.broken_image),
                    title: Text('${thisItem['productname']}'),
                    subtitle: Text('${thisItem['price']}'),
                    trailing: Row(
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
                          onPressed: () => _deleteItem(thisItem['id']),
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
