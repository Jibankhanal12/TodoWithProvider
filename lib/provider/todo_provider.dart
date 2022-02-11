import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: "i have an interview",
        description: 'Avocardo Technology'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
    Todo(
        createdTime: DateTime.now(),
        title: "Basketball",
        description: 'whith the college boys'),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
