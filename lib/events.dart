// import 'package:bekart/customs/customevents.dart';
// import 'package:bekart/home.dart';
// import 'package:bekart/sshop/addpage.dart';
// import 'package:bekart/viewexam.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// class Events extends StatefulWidget {
//   const Events({super.key});

//   @override
//   State<Events> createState() => _EventsState();
// }

// class _EventsState extends State<Events> {
//   CollectionReference _collectionReferenceShoppingList =
//       FirebaseFirestore.instance.collection('Events');
//   late Stream<QuerySnapshot> _streameventListItems;

//   @override
//   void initState() {
//     super.initState();
//     _streameventListItems = _collectionReferenceShoppingList.snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Celebrate your special days',
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
//         ),
//         backgroundColor: Color.fromARGB(255, 191, 154, 94),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'The most beautiful things are not associated with money, they are memories and moments...',
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               StreamBuilder<QuerySnapshot>(
//                 stream: _streameventListItems,
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(child: Text(snapshot.error.toString()));
//                   }
//                   if (snapshot.connectionState == ConnectionState.active) {
//                     QuerySnapshot querySnapshot = snapshot.data;
//                     List<QueryDocumentSnapshot> documents = querySnapshot.docs;

//                     // Mapping Firestore documents to Map<String, dynamic>
//                     List<Map<String, dynamic>> items = documents
//                         .map((doc) => {
//                               'id': doc.id,
//                               'event': doc['event'] ?? 'Event not available',
//                               'eventteamname':
//                                   doc['eventteamname'] ?? 'Team not available',
//                               'phone': doc['phone'] ?? 'phone not available',
//                               'eventImage': doc['eventImage'] ?? '',
//                             })
//                         .toList();

//                     return ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         Map<String, dynamic> thisItem = items[index];
//                         return Container(
//                           margin: const EdgeInsets.symmetric(vertical: 10),
//                           height: 200,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       thisItem['eventteamname'],
//                                       style: const TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Spacer(),
//                                     Container(
//                                       height: 100,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: thisItem['eventImage'] != ''
//                                               ? DecorationImage(
//                                                   image: NetworkImage(
//                                                       thisItem['eventImage']),
//                                                   fit: BoxFit.cover,
//                                                   onError:
//                                                       (error, stackTrace) {},
//                                                 )
//                                               : const DecorationImage(
//                                                   image: AssetImage(
//                                                       'assets/images/placeholder.png'),
//                                                   fit: BoxFit.cover)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       thisItem['event'],
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 100,
//                                     ),
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.phone),
//                                     ),
//                                     Text(
//                                       thisItem['phone'],
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return const Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bekart/home.dart';
import 'package:bekart/sshop/addpage.dart';
import 'package:bekart/viewexam.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  CollectionReference _collectionReferenceShoppingList =
      FirebaseFirestore.instance.collection('Events');
  late Stream<QuerySnapshot> _streameventListItems;

  @override
  void initState() {
    super.initState();
    _streameventListItems = _collectionReferenceShoppingList.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Celebrate your special days',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'The most beautiful things are not associated with money, they are memories and moments...',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<QuerySnapshot>(
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
                              'event': doc['event'] ?? 'Event not available',
                              'eventteamname':
                                  doc['eventteamname'] ?? 'Team not available',
                              'phone': doc['phone'] ?? 'phone not available',
                              'eventImage': doc['eventImage'] ?? '',
                            })
                        .toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> thisItem = items[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      thisItem['eventteamname'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: thisItem['eventImage'] != ''
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      thisItem['eventImage']),
                                                  fit: BoxFit.cover,
                                                  onError:
                                                      (error, stackTrace) {},
                                                )
                                              : const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/placeholder.png'),
                                                  fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      thisItem['event'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final Uri callUri = Uri(
                                          scheme: 'tel',
                                          path: thisItem['phone'],
                                        );
                                        if (await canLaunchUrl(callUri)) {
                                          await launchUrl(callUri);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Could not launch ${thisItem['phone']}'),
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(Icons.phone),
                                    ),
                                    Text(
                                      thisItem['phone'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
