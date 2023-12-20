

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/use_case.dart';
import 'package:to_do_list/domain/entities/unique_id.dart';
import 'package:to_do_list/domain/use_cases/load_todo_entry.dart';

import 'todo_entry_cubit_state.dart';
// part of 'todo_entry_cubit_state.dart';

class ToDoEntryItemCubit extends Cubit<ToDoEntryItemCubitState>{
  ToDoEntryItemCubit({ToDoEntryItemCubitState? initialState,required this.collectionId,required this.entryId,required this.loadToDoEntry, }):super(initialState??const ToDoEntryItemLoadingState());
  
  final CollectionId collectionId;
  final EntryId entryId;
  final LoadToDoEntry loadToDoEntry;

Future<void> fetch()async{
  emit(const ToDoEntryItemLoadingState());
  try{
    var entry=await loadToDoEntry.call(ToDoEntryIdsParam(collectionId: collectionId, entryId: entryId));
  
  return entry.fold((left) => emit(const ToDoEntryItemErrorState()), (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)));

  }on Exception{
    emit(const ToDoEntryItemErrorState());
  }

}

UnimplementedError update(){
  return UnimplementedError();
}

}