import 'package:either_dart/either.dart';
import 'package:to_do_list/domain/entities/todo_collection.dart';

import '../failures/failures.dart';

abstract class ToDoRepository{
  Future<Either<Failure,List<ToDoCollection>>> readTodoCollection();
}