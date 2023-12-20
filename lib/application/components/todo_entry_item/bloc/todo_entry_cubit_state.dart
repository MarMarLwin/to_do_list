// part of 'todo_entry_item_cubit.dart';

import 'package:equatable/equatable.dart';

import '../../../../domain/entities/todo_entry.dart';

abstract class ToDoEntryItemCubitState extends Equatable{
  const ToDoEntryItemCubitState();
   @override

  List<Object?> get props => [];
}

class ToDoEntryItemLoadingState extends ToDoEntryItemCubitState{
 const ToDoEntryItemLoadingState();
}

class ToDoEntryItemLoadedState extends ToDoEntryItemCubitState{

  final ToDoEntry toDoEntry;
 const ToDoEntryItemLoadedState({required this.toDoEntry});
  @override
  List<Object?> get props => [toDoEntry];
}

class ToDoEntryItemErrorState extends ToDoEntryItemCubitState{
 const ToDoEntryItemErrorState();
}