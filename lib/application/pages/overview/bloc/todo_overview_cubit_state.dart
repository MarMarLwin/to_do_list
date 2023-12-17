import 'package:equatable/equatable.dart';

import '../../../../domain/entities/todo_collection.dart';

abstract class ToDoOverviewCubitState extends Equatable {
  const ToDoOverviewCubitState();

  @override
  List<Object> get props => [];
}

class ToDoOverviewCubitLoadingState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitErrorState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitLoadedState extends ToDoOverviewCubitState {
  const ToDoOverviewCubitLoadedState({required this.collections});

  final List<ToDoCollection> collections;
   @override
  List<Object> get props => [collections];
}