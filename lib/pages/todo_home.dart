import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/pages/add_todo.dart';
import 'package:todo/utils/completed_todo_list.dart';
import 'package:todo/utils/todoList_widget.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [const TodoListWidget(), const CompletedTodo()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        elevation: 0,
        title: Text("Todo App", style: GoogleFonts.rubik()),
        leading: const Icon(Icons.menu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red.shade400,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined, size: 24),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done_all_outlined,
                size: 24,
              ),
              label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red.shade400,
        onPressed: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const AddTodo();
            }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
