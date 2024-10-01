import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/shopaddmodal.dart';
import '../cartProviderModel/podctPeviewsingProvider.dart';

class kRBakersview extends StatefulWidget {
  // viewplanetcafe({super.key, required this.resName});
  const kRBakersview({super.key,});



  @override
  State<kRBakersview> createState() => _kRBakersviewState();
}

class _kRBakersviewState extends State<kRBakersview> {
  late Stream<QuerySnapshot> _streamPaperItems;

  @override
  void initState() {
    super.initState();
    _streamPaperItems = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: 'cakeland')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Paper products"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamPaperItems,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            List<Shopaddmodal> items = snapshot.data!.docs
                .map((doc) =>
                Shopaddmodal.fromJson(doc.data() as Map<String, dynamic>))
                .toList();

            return GridView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                Shopaddmodal thisItem = items[index];
                log('Image URL: ${thisItem.productimage}');

                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2), // Border color and width
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        thisItem.productimage.isNotEmpty
                            ? Image.network(thisItem.productimage,
                            width:
                            double.infinity, // Adjust width as needed
                            height: 120, // Adjust height as needed
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                              return Icon(Icons.broken_image, size: 50);
                            } // Fallback in case of error
                        )
                            : const Icon(Icons.broken_image, size: 60),
                        // Adjust icon size as needed
                        const SizedBox(
                            height: 8), // Space between image and text
                        Text(
                          thisItem.productname.isNotEmpty
                              ? thisItem.productname
                              : 'Name not available',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Price:  ${thisItem.price.toString()}\$'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPreviewProvider(
                                          detailedProduct: thisItem)));
                            },
                            child: Text("BUY NOW"))
                      ],
                    ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 10, // Space between rows
                crossAxisSpacing: 10, // Space between columns
                childAspectRatio:
                0.6, // Aspect ratio of each grid item or height adjust
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
