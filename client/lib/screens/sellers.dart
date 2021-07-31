import 'package:client/screens/sellitem.dart';
import 'package:client/shared/appbar.dart';
import 'package:client/shared/drawer.dart';
import 'package:client/shared/sellerlist.dart';
import 'package:flutter/material.dart';

class Sellers extends StatefulWidget {
  Sellers({Key? key}) : super(key: key);

  @override
  _SellersState createState() => _SellersState();
}

class _SellersState extends State<Sellers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBarCommon(
        title: Text(''),
        appBar: AppBar(),
        onpress: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SellItem()));
        },
        label: Text("Sell an Item"),
        icon: Icon(Icons.sell),
      ),
      drawer: DrawerCommon(),
      body: SellerList(),
    );
  }
}