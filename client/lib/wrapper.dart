import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObject?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Nav();
    }
  }
}
