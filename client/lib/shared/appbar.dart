import 'package:flutter/material.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  const AppBarCommon({required this.title, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Color(0xFF29BF12),
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(
          textColor: Color(0xFFFFFFFF),
          onPressed: () async {},
          label: Text("Add Items"),
          icon: Icon(Icons.add_a_photo_rounded),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
