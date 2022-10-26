import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class SearchNoteUseCase extends BaseUseCase<List<Note>, SearchNoteParameters> {
  final BaseNotesRepository baseNotesRepository;

  SearchNoteUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, List<Note>>> call(
      SearchNoteParameters parameters) async {
    return await baseNotesRepository.searchNote(parameters);
  }
}

class SearchNoteParameters extends Equatable {
  final String title;

  const SearchNoteParameters({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}
