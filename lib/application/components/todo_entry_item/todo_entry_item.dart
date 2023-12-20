import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/application/components/todo_entry_item/bloc/todo_entry_cubit_state.dart';
import 'package:to_do_list/application/components/todo_entry_item/bloc/todo_entry_item_cubit.dart';
import 'package:to_do_list/application/components/todo_entry_item/view_states/todo_entry_item_error.dart';
import 'package:to_do_list/application/components/todo_entry_item/view_states/todo_entry_item_loading.dart';
import 'package:to_do_list/domain/entities/unique_id.dart';
import 'package:to_do_list/domain/repositories/todo_repository.dart';
import 'package:to_do_list/domain/use_cases/load_todo_entry.dart';

import 'view_states/todo_entry_item_loaded.dart';

class ToDoEntryItemBlocProvider extends StatelessWidget {
  const ToDoEntryItemBlocProvider(
      {super.key, required this.collectionId, required this.entryId});

  final CollectionId collectionId;
  final EntryId entryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoEntryItemCubit>(
      create: (context) => ToDoEntryItemCubit(
          collectionId: collectionId,
          entryId: entryId,
          loadToDoEntry: LoadToDoEntry(
              toDoRepository: RepositoryProvider.of<ToDoRepository>(context)))
        ..fetch(),
      child: const ToDoEntryItem(),
    );
  }
}

class ToDoEntryItem extends StatelessWidget {
  const ToDoEntryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoEntryItemCubit, ToDoEntryItemCubitState>(
      builder: (context, state) {
        if (state is ToDoEntryItemLoadingState) {
          return const ToDoEntryItemLoading();
        } else if (state is ToDoEntryItemLoadedState) {
          return ToDoEntryItemLoaded(toDoEntry: state.toDoEntry);
        } else {
          return const ToDoEntryItemError();
        }
      },
    );
  }
}
