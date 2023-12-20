import 'package:equatable/equatable.dart';
import 'package:to_do_list/domain/entities/unique_id.dart';

abstract class ToDoDetailCubitState extends Equatable{
  const ToDoDetailCubitState();
   @override
     List<Object?> get props => [];
}

class ToDoDetailCubitLoading extends ToDoDetailCubitState{
  const ToDoDetailCubitLoading();
}
class ToDoDetailCubitError extends ToDoDetailCubitState{
  const ToDoDetailCubitError();
}
class ToDoDetailCubitLoaded extends ToDoDetailCubitState{
  final List<EntryId> entryIds;

  const ToDoDetailCubitLoaded({required this.entryIds});
  @override
     List<Object?> get props => [entryIds];
}
