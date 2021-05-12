import 'package:flutter/material.dart';
import 'package:ipvp/ToDoHome/list_provider.dart';
import 'package:ipvp/ToDoHome/home_page.dart';
import 'package:provider/provider.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ListProvider>(
          create: (context) => ListProvider(), child: MyHomePage()),
    );
  }
}