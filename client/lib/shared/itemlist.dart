import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('sellitems')
            // .orderBy('Date')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // var arr = snapshot.data!.docs.map((document) => document['Input']);
          else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return SizedBox(
                  width: 100,
                  height: 500,
                  child: Card(
                    color: Colors.blue,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          // leading: Icon(Icons.podcasts_outlined),
                          // isThreeLine: true,
                          // tileColor: Color(0x55caf0f8),
                          title: Text(
                            '${doc['Title']}',
                          ),

                          // subtitle: Text(
                          //   "${doc['Username']}\n${doc['Date'].toString().substring(0, 10)} at ${doc['Date'].toString().substring(11, 16)}",
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //     fontStyle: FontStyle.italic,
                          //     color: Color(0xFF0096c7),
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              // '${snapshot.data!.docs.map((document) => document['Input'])}'),
            );
          }
        },
      ),
    );
  }
}
