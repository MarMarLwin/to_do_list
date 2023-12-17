
import 'package:either_dart/either.dart';

import '../../domain/entities/todo_collection.dart';
import '../../domain/entities/todo_color.dart';
import '../../domain/entities/unique_id.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/todo_repository.dart';

class ToDoRepositoryMock implements ToDoRepository {
  @override
  Future<Either<Failure, List<ToDoCollection>>> readTodoCollection() {
    final list = List<ToDoCollection>.generate(
      10,
      (index) => ToDoCollection(
        id: CollectionId.fromUniqueString(index.toString()),
        title: 'title $index',
        color: ToDoColor(
          colorIndex: index % ToDoColor.predefinedColors.length,
        ),
      ),
    );

    return Future.delayed(
      const Duration(milliseconds: 200),
      () => Right(list),
    );
  }

}