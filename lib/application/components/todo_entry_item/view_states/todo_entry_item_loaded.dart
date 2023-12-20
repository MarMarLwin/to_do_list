import 'package:flutter/material.dart';

import '../../../../domain/entities/todo_entry.dart';

class ToDoEntryItemLoaded extends StatelessWidget {
  const ToDoEntryItemLoaded({super.key, required this.toDoEntry});

  final ToDoEntry toDoEntry;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: toDoEntry.isDone, onChanged: (value){}, title: Text(toDoEntry.description),);
  }
}