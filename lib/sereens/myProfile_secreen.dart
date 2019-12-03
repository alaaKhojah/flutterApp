import 'package:flutter/material.dart';
class MyProfileScreen extends StatelessWidget {
    static const routeName = 'my-profile';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
children: <Widget>[
  Container(color: Colors.red, height: 150.0),
          Container(color: Colors.purple, height: 150.0),
          Container(color: Colors.green, height: 150.0),
          Container(color: Colors.red, height: 150.0),
          Container(color: Colors.purple, height: 150.0),
          Container(color: Colors.green, height: 150.0),
],
      ),
    );
  }
}