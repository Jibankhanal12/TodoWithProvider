import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/todo_widget.dart';

import '../provider/todo_provider.dart';

class CompletedTodo extends StatelessWidget {
  const CompletedTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? Center(
            child: Text(
              'Sorry! No todos',
              style: GoogleFonts.rubik(fontSize: 20),
            ),
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(4, 5),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoWidget(
                  todo: todo,
                );
              },
            ),
          );
  }
}
