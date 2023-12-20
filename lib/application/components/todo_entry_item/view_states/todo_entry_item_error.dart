import 'package:flutter/material.dart';

class ToDoEntryItemError extends StatelessWidget {
  const ToDoEntryItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Icon(Icons.warning_rounded),Text('To Do entry not loaded')
    ],);
  }
}