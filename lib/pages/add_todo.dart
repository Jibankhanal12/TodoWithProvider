import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/utils/text_field_widget.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Todo",
              style:
                  GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TodoWidgets(
              onchangedTitle: (title) => setState(() => this.title = title),
              onchangedDescription: (description) =>
                  setState(() => this.description = description),
              onSaveTodo: () {
                addTodo();
              },
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formkey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todos = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.addTodo(todos);

      Navigator.of(context).pop();
    }
  }
}
