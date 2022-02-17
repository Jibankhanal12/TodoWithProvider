import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/utils/edit_todo.dart';
import 'package:todo/utils/snackbar.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Slidable(
            startActionPane: ActionPane(
              key: Key(todo.id),
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => editTodo(context, todo),
                  backgroundColor: Colors.blueGrey,
                  icon: Icons.edit,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => deletTodo(context, todo),
                  backgroundColor: Colors.blueGrey,
                  icon: Icons.delete,
                )
              ],
            ),
            child: buildTodo(context)),
      );

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
                activeColor: Colors.blueGrey,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodoProvider>(context, listen: false);
                  final isDone = provider.toogleCheckstatus(todo);
                  Snackbar.showSnackbar(context,
                      isDone ? 'Task Completed' : 'Task is not completed');
                }),
            const SizedBox(height: 20),
            Expanded(
                child: Column(
              children: [
                Text(todo.title,
                    style: GoogleFonts.rubik(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(todo.description,
                        style: GoogleFonts.rubik(
                            fontSize: 15, fontWeight: FontWeight.w400)),
                  )
              ],
            ))
          ],
        ),
      );

  void deletTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTodo(todo, context);
    Snackbar.showSnackbar(context, 'Deleted');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditTodo(
              todo: todo,
            )));
  }
}
