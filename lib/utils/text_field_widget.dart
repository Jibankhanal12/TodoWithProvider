import 'package:flutter/material.dart';

class TodoWidgets extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onchangedTitle;
  final ValueChanged<String> onchangedDescription;
  final VoidCallback onSaveTodo;

  const TodoWidgets({
    Key? key,
    this.title,
    this.description,
    required this.onchangedTitle,
    required this.onchangedDescription,
    required this.onSaveTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: title,
            onChanged: onchangedTitle,
            maxLines: 1,
            validator: (title) {
              if (title!.isEmpty) {
                return 'The description cannot be empty';
              }
              return null;
            },
            cursorHeight: 20,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                )),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            maxLines: 1,
            initialValue: description,
            onChanged: onchangedDescription,
            validator: (description) {
              if (description!.isEmpty) {
                return 'The description cannot be empty';
              }
              return null;
            },
            cursorHeight: 20,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                labelText: 'Description',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.red.shade400)),
              onPressed: () {},
              child: const Text('Save')),
        )
      ],
    );
  }
}
