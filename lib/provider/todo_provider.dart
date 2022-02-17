import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todos) {
    _todos.add(todos);
    notifyListeners();
  }

  void removeTodo(Todo todo, BuildContext context) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toogleCheckstatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
