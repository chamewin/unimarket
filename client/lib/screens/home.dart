import 'package:client/screens/additem.dart';
import 'package:client/services/auth.dart';
import 'package:client/shared/appbar.dart';
import 'package:client/shared/drawer.dart';
import 'package:client/shared/swipedcards.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  // Create instant object _auth
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: Text(''),
        appBar: AppBar(),
        onpress: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddItem()));
        },
        label: Text("Add Items"),
        icon: Icon(Icons.add_a_photo_rounded),
      ),
      drawer: DrawerCommon(),
      body: Swipecard(),
    );
  }
}
