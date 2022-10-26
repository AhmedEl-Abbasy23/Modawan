import 'package:dartz/dartz.dart';
import 'package:notes/core/error/exceptions.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/notes/data/datasource/notes_local_database.dart';
import 'package:notes/notes/data/models/note_model.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';
import 'package:notes/notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/notes/domain/usecases/get_note_details.dart';
import 'package:notes/notes/domain/usecases/search_note_usecase.dart';
import 'package:notes/notes/domain/usecases/update_note_usecase.dart';

class NotesRepository extends BaseNotesRepository {
  BaseNotesLocalDataSource baseNotesLocalDataSource;

  NotesRepository(this.baseNotesLocalDataSource);

  @override
  Future<Either<Failure, void>> addNote(AddNoteParameters parameters) async {
    try {
      return Right(await baseNotesLocalDataSource.addNote(parameters));
    } on LocalDatabaseException catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(
      DeleteNoteParameters parameters) async {
    try {
      return Right(await baseNotesLocalDataSource.deleteNote(parameters));
    } on LocalDatabaseException catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(
      UpdateNoteParameters parameters) async {
    try {
      return Right(await baseNotesLocalDataSource.updateNote(parameters));
    } on LocalDatabaseException catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, NoteModel>> getNoteDetails(
      GetNoteDetailsParameters parameters) async {
    try {
      return Right(await baseNotesLocalDataSource.getNoteDetails(parameters));
    } on LocalDatabaseException catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      return Right(await baseNotesLocalDataSource.getNotes());
    } on LocalDatabaseException catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> searchNote(SearchNoteParameters parameters) async{
    try {
      return Right(await baseNotesLocalDataSource.searchNote(parameters));
    } on LocalDatabaseException catch (failure) {
    return Left(DatabaseFailure(failure.message));
    }
  }
}
