import 'package:flutter/material.dart';
import 'package:to_do_list/application/components/todo_entry_item/todo_entry_item.dart';
import 'package:to_do_list/domain/entities/unique_id.dart';

class ToDoDetailLoaded extends StatelessWidget {
  const ToDoDetailLoaded(
      {super.key, required this.collectionId, required this.entryIds});

  final CollectionId collectionId;
  final List<EntryId> entryIds;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoEntryItemBlocProvider(collectionId: collectionId, entryId: entryIds[index]);
          },
          itemCount: entryIds.length),
    ));
  }
}
