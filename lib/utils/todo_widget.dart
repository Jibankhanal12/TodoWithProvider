import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {},
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
                  onPressed: (_) {},
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
                onChanged: (_) {}),
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
}
