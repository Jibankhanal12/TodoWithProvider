import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/text_field_widget.dart';

import '../model/todo_model.dart';
import '../provider/todo_provider.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;
  const EditTodo({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final _formkey = GlobalKey<FormState>();
  late String title;
  late String description;
  @override
  void initState() {
    title = widget.todo.title;
    description = widget.todo.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Edit TOdo")),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodoWidgets(
              title: title,
              description: description,
              onchangedTitle: (title) => setState(() => this.title = title),
              onchangedDescription: (description) =>
                  setState(() => this.description = description),
              onSaveTodo: () {
                saveTodo();
              },
            ),
          ),
        ));
  }

  void saveTodo() {
    final isValid = _formkey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
