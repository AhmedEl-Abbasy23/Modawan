import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/local/sql_constants.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class AddNoteUseCase extends BaseUseCase<void, AddNoteParameters> {
  final BaseNotesRepository baseNotesRepository;

  AddNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, void>> call(AddNoteParameters parameters) async {
    return await baseNotesRepository.addNote(parameters);
  }
}

class AddNoteParameters extends Equatable {
  final String title;
  final String details;
  final String color;

  const AddNoteParameters({
    required this.title,
    required this.details,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      SQLConstants.title: title,
      SQLConstants.details: details,
      SQLConstants.color: color,
    };
  }

  @override
  List<Object> get props => [title, details, color];
}
