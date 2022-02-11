import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/utils/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;
    return Container(
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
