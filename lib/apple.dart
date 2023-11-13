import 'package:flutter/material.dart';

class Apple extends StatelessWidget {
  final String Title;
  Apple(this.Title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Title),
      ),
    );
  }
}
