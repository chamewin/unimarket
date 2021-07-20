import 'dart:ffi';

import 'package:client/screens/home.dart';
import 'package:client/shared/appbar.dart';
import 'package:client/shared/constants.dart';
import 'package:client/shared/drawer.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  String iname = '';
  late Double iprice;

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
