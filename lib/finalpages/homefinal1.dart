import 'package:bekart/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Finalhome1 extends StatefulWidget {
  const Finalhome1({super.key});

  @override
  State<Finalhome1> createState() => _Finalhome1State();
}

class _Finalhome1State extends State<Finalhome1> {
  CollectionReference _collectionReferenceShoppingList =
      FirebaseFirestore.instance.collection('products');
  late Stream<QuerySnapshot> _streamProductListItems;

  @override
  void initState() {
    super.initState();
    _streamProductListItems = _collectionReferenceShoppingList.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Bekart',
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        title: const Text('Order your favourite sweets...'),
        backgroundColor: const Color.fromARGB(255, 191, 154, 94),
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
                      'shopname': doc['shopname'] ?? 'Name not available',
                      'productname':
                          doc['productname'] ?? 'Product not available',
                      'productimage': doc['productimage'] ?? '',
                      'rating':
                          doc['rating']?.toString() ?? 'Rating not available',
                    })
                .toList();

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> thisItem = items[index];
                return InkWell(
                  onTap: () {
                    // Navigate to the ShopDetailsPage when an item is tapped
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Planetcafe(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
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
                                  errorBuilder: (context, error, stackTrace) {
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
                                    fontSize: 15, fontWeight: FontWeight.bold),
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
