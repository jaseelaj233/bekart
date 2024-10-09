import 'dart:io';
import 'package:bekart/model/eventsmodel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Eventsadd extends StatefulWidget {
  const Eventsadd({super.key});

  @override
  State<Eventsadd> createState() => _EventsaddState();
}

class _EventsaddState extends State<Eventsadd> {
  TextEditingController Eventscontroler = TextEditingController();
  TextEditingController Eventstemcontroler = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  String _imageURL = '';
  bool _isUploading = false;
  final formkey = GlobalKey<FormState>();
  final CollectionReference Eventcollection =
      FirebaseFirestore.instance.collection('Events');

  String generateUniqueEventid() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> addEventsfirebase() async {
    String uniqueid = generateUniqueEventid();
    Eventsmodel Eventsaddmodal1 = Eventsmodel(
      event: Eventscontroler.text,
      eventTeamName: Eventstemcontroler.text,
      eventImage: imagecontroller.text,
      phone: phonecontroller.text,
    );
    try {
      await Eventcollection.doc(uniqueid).set(Eventsaddmodal1.toJson());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Event added successfully')));
      Eventscontroler.clear();
      Eventstemcontroler.clear();
      imagecontroller.clear();
      phonecontroller.clear();

      setState(() {
        _imageURL = '';
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Event adding failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Events'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Event name is required";
                  } else {
                    return null;
                  }
                },
                controller: Eventscontroler,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Event Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Team name is required";
                  } else {
                    return null;
                  }
                },
                controller: Eventstemcontroler,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Team Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone is is required";
                  } else {
                    return null;
                  }
                },
                controller: phonecontroller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (file == null) return;
                    String uniquefilename =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    setState(() {
                      _isUploading = true;
                    });
                    try {
                      Reference _referencedirupload = FirebaseStorage.instance
                          .ref()
                          .child('Eventimage/${user!.uid}');
                      Reference _referenceimageupload =
                          _referencedirupload.child('$uniquefilename.jpg');
                      await _referenceimageupload.putFile(File(file.path));
                      _imageURL = await _referenceimageupload.getDownloadURL();
                      setState(() {
                        _isUploading = false;
                        imagecontroller.text = _imageURL; // Update image URL
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error uploading image: $e')));
                    }
                  },
                  child: Text('Upload Event Image')),
              if (_isUploading) CircularProgressIndicator(),
              if (!_isUploading)
                _imageURL.isNotEmpty
                    ? Container(
                        child: Image.network(
                          _imageURL,
                          fit: BoxFit.fitHeight,
                        ),
                        height: 200,
                        width: 200,
                      )
                    : Icon(
                        Icons.broken_image,
                        size: 150,
                        color: Colors.purple,
                      ),
              SizedBox(height: 100),
              Container(
                height: 50,
                width: 150,
                child: TextButton(
                    onPressed: addEventsfirebase,
                    child: Text('Submit'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
