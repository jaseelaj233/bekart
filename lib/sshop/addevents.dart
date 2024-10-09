import 'package:bekart/events.dart';
import 'package:bekart/sshop/editevents.dart';
import 'package:bekart/sshop/eventspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addevents extends StatefulWidget {
  const Addevents({super.key});

  @override
  State<Addevents> createState() => _AddeventsState();
}

class _AddeventsState extends State<Addevents> {
  CollectionReference _collectionReferenceShoppingList =
      FirebaseFirestore.instance.collection('Events');
  late Stream<QuerySnapshot> _streameventListItems;

  @override
  void initState() {
    super.initState();
    _streameventListItems = _collectionReferenceShoppingList.snapshots();
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

    TextEditingController phonecontroller =
        TextEditingController(text: currentData['phone']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Item"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(labelText: 'phone'),
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
                  'phone': phonecontroller.text,
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

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
          title: Text(
            ' Events details',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Eventsadd(),
                ));
              },
              child: Text('Add Events'),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _streameventListItems,
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
                            'event': doc['event'] ?? 'event not available',
                            'eventteamname':
                                doc['eventteamname'] ?? 'team not available',
                            'phone': doc['phone'] ?? 'phone not available',
                            'eventImage': doc['eventImage'] ?? '',
                          })
                      .toList();

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> thisItem = items[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
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
                              thisItem['eventImage'] != ''
                                  ? Image.network(
                                      thisItem['eventImage'],
                                      height: 180,
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
                                    thisItem['event'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    thisItem['eventteamname'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    thisItem['phone'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      print(
                                          "Edit button clicked for: ${thisItem['eventImage']}");
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
