import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/use_case.dart';
import 'package:to_do_list/domain/entities/unique_id.dart';
import 'package:to_do_list/domain/use_cases/load_todo_entry_ids_for_collection.dart';

import 'todo_detail_cubit_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailCubitState>{
  ToDoDetailCubit({ToDoDetailCubitState? initialState,required this.collectionId,required this.loadToDoEntryIdsForCollection}):super(initialState??const ToDoDetailCubitLoading());

  final CollectionId collectionId;
  final LoadToDoEntryIdsForCollection loadToDoEntryIdsForCollection;

Future<void> fetch() async{
emit(const ToDoDetailCubitLoading());
try{

  final entryIds= await loadToDoEntryIdsForCollection.call(CollectionIdParam(collectionId: collectionId));
  if(entryIds.isLeft){
    emit(ToDoDetailCubitError());
  }else{
    emit(ToDoDetailCubitLoaded(entryIds: entryIds.right));
  }

}on Exception {
  emit(ToDoDetailCubitError());
}
}
}