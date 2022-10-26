import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class DeleteNoteUseCase extends BaseUseCase<void, DeleteNoteParameters> {
  final BaseNotesRepository baseNotesRepository;

  DeleteNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, void>> call(DeleteNoteParameters parameters) async {
    return await baseNotesRepository.deleteNote(parameters);
  }
}

class DeleteNoteParameters extends Equatable {
  final int id;

  const DeleteNoteParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
