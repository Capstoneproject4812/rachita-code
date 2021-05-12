import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Assessmment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Assessment"),
      ),
      body: Center(
        child:ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Dashboard'),
        ),
      ),
    );
  }
}