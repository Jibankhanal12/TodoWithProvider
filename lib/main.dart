import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/todo_home.dart';
import 'package:todo/provider/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        title: 'Flutter Demo',
        home: const TodoHomePage(),
      ),
    );
  }
}
