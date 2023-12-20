import 'package:either_dart/either.dart';
import 'package:to_do_list/core/use_case.dart';
import 'package:to_do_list/domain/failures/failures.dart';
import 'package:to_do_list/domain/repositories/todo_repository.dart';

import '../entities/unique_id.dart';

class LoadToDoEntryIdsForCollection
    implements UseCase<List<EntryId>, CollectionIdParam> {
  const LoadToDoEntryIdsForCollection(this.toDoRepository);

  final ToDoRepository toDoRepository;
  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadIds = toDoRepository.readToDoEntryIds(params.collectionId);

      return loadIds.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
