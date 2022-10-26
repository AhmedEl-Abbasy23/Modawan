import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/local/sql_constants.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class UpdateNoteUseCase extends BaseUseCase<void, UpdateNoteParameters> {
  final BaseNotesRepository baseNotesRepository;

  UpdateNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, void>> call(UpdateNoteParameters parameters) async {
    return await baseNotesRepository.updateNote(parameters);
  }
}

class UpdateNoteParameters extends Equatable {
  final int id;
  final String title;
  final String details;

  const UpdateNoteParameters({
    required this.id,
    required this.title,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      SQLConstants.title: title,
      SQLConstants.details: details,
    };
  }

  @override
  List<Object> get props => [id, title, details];
}
