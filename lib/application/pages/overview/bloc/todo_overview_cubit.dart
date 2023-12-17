import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/application/pages/overview/bloc/todo_overview_cubit_state.dart';

import '../../../../core/use_case.dart';
import '../../../../domain/use_cases/load_todo_collections.dart';

class ToDoOverviewCubit extends Cubit<ToDoOverviewCubitState>{
  ToDoOverviewCubit({ToDoOverviewCubitState? initialState,required this.loadToDoCollections}):super(initialState??  ToDoOverviewCubitLoadingState());

   final LoadToDoCollections loadToDoCollections;

 Future<void> readToDoCollections() async {
    emit(ToDoOverviewCubitLoadingState());
    try {
      final collectionsFuture = loadToDoCollections.call(NoParams());
      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(ToDoOverviewCubitErrorState());
      } else {
        emit(ToDoOverviewCubitLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(ToDoOverviewCubitErrorState());
    }
  }
}