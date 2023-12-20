import 'package:either_dart/either.dart';
import 'package:to_do_list/domain/entities/todo_collection.dart';

import '../entities/todo_entry.dart';
import '../entities/unique_id.dart';
import '../failures/failures.dart';

abstract class ToDoRepository{
  Future<Either<Failure,List<ToDoCollection>>> readTodoCollection();
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId);

  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId);
}