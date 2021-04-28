import 'package:flutter/material.dart';

class CustomBody extends StatefulWidget {
  @override
  _CustomBodyState createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello world'),
    );
  }
}
