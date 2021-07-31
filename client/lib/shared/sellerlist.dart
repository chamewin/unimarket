import 'package:client/screens/authenticate/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerList extends StatefulWidget {
  const SellerList({Key? key}) : super(key: key);

  @override
  _SellerListState createState() => _SellerListState();
}

class _SellerListState extends State<SellerList> {
  //Variable to keep itemID
  String itemID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(width: 2, color: Colors.green),
                    ),
                    color: Color(0xFFf1faee),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 0, 5),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(Icons.person),
                                      Text(
                                        '${doc['Full Name']}',
                                        style: TextStyle(
                                          fontFamily: 'DaysOne',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          onTap: () {
                            alert(context, doc['User ID']);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  void alert(context, uid) async {
    return showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: Text(
            'Do you want to buy this item?',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF29BF12),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                "No",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFe76f51),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Payment(value: uid)));
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF29BF12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
