import 'dart:ffi';
import 'dart:io';

import 'package:client/screens/home.dart';
import 'package:client/shared/appbar.dart';
import 'package:client/shared/constants.dart';
import 'package:client/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  String iname = '';
  late Double iprice;
  File? imageFile;
  var isInitialized = false;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: Text(''),
        appBar: AppBar(),
        onpress: () async {
          Navigator.pop(context, MaterialPageRoute(builder: (_) => Home()));
        },
        label: Text("Cancel"),
        icon: Icon(Icons.cancel),
      ),
      drawer: DrawerCommon(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 300,
                        child: imageFile == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                      // leading: Icon(Icons.add_a_photo_outlined),
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo_outlined,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add Photo from Library',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await _getFromGallery();
                                      }),
                                ],
                              )
                            : Container(
                                child: Image.file(
                                  imageFile!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Item\'s Name required' : null,
                      onChanged: (value) {
                        setState(() => iname = value);
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Item\'s Price required' : null,
                      onChanged: (value) {
                        setState(() => iprice = value as Double);
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Price',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Item\'s Price required' : null,
                      onChanged: (value) {
                        setState(() => iprice = value as Double);
                      },
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Sell this Item',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 17)),
                        color: Color(0xFF29BF12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
