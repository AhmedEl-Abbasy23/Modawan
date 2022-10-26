import 'package:dartz/dartz.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class GetNotesUseCase extends BaseUseCase<List<Note>, NoParameters> {
  final BaseNotesRepository baseNotesRepository;

  GetNotesUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, List<Note>>> call(NoParameters parameters) async {
    return await baseNotesRepository.getNotes();
  }
}
