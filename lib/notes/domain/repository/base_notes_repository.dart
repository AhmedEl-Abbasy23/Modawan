import 'package:dartz/dartz.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/notes/domain/usecases/get_note_details.dart';
import 'package:notes/notes/domain/usecases/search_note_usecase.dart';
import 'package:notes/notes/domain/usecases/update_note_usecase.dart';

abstract class BaseNotesRepository {
  Future<Either<Failure, void>> addNote(AddNoteParameters parameters);

  Future<Either<Failure, void>> deleteNote(DeleteNoteParameters parameters);

  Future<Either<Failure, void>> updateNote(UpdateNoteParameters parameters);

  Future<Either<Failure, List<Note>>> getNotes();

  Future<Either<Failure, Note>> getNoteDetails(
      GetNoteDetailsParameters parameters);

  Future<Either<Failure, List<Note>>> searchNote(
      SearchNoteParameters parameters);
}
