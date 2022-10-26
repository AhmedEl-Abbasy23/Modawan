import 'package:notes/core/local/sql_constants.dart';
import 'package:notes/core/services/init_database.dart';
import 'package:notes/notes/data/models/note_model.dart';
import 'package:notes/notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/notes/domain/usecases/get_note_details.dart';
import 'package:notes/notes/domain/usecases/search_note_usecase.dart';
import 'package:notes/notes/domain/usecases/update_note_usecase.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseNotesLocalDataSource {
  Future<void> addNote(AddNoteParameters parameters);

  Future<void> deleteNote(DeleteNoteParameters parameters);

  Future<void> updateNote(UpdateNoteParameters parameters);

  Future<List<NoteModel>> getNotes();

  Future<NoteModel> getNoteDetails(GetNoteDetailsParameters parameters);

  Future<List<NoteModel>> searchNote(SearchNoteParameters parameters);
}

class NotesLocalDataSource extends BaseNotesLocalDataSource {
  @override
  Future<void> addNote(AddNoteParameters parameters) async {
    Database? database = await SQLDatabase().db;
    await database!.insert(SQLConstants.notesTable, parameters.toJson());
  }

  @override
  Future<void> deleteNote(DeleteNoteParameters parameters) async {
    Database? database = await SQLDatabase().db;
    await database!.delete(
      SQLConstants.notesTable,
      where: '${SQLConstants.id} = ${SQLConstants.query}', // "id = ?"
      whereArgs: [parameters.id],
    );
  }

  @override
  Future<void> updateNote(UpdateNoteParameters parameters) async {
    Database? database = await SQLDatabase().db;
    await database!.update(
      SQLConstants.notesTable,
      parameters.toJson(),
      where: '${SQLConstants.id} = ${SQLConstants.query}', // "id = ?"
      whereArgs: [parameters.id],
    );
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    Database? database = await SQLDatabase().db;
    List<Map<String, dynamic>> response =
        await database!.query(SQLConstants.notesTable);
    return response.map((note) => NoteModel.fromJson(note)).toList();
  }

  @override
  Future<NoteModel> getNoteDetails(GetNoteDetailsParameters parameters) async {
    Database? database = await SQLDatabase().db;
    List<Map<String, Object?>> response = await database!.query(
      SQLConstants.notesTable,
      where: '${SQLConstants.id}=${SQLConstants.query}',
      whereArgs: [parameters.id],
    );
    return NoteModel.fromJson(response.first);
  }

  @override
  Future<List<NoteModel>> searchNote(SearchNoteParameters parameters) async{
    Database? database = await SQLDatabase().db;
    List<Map<String, Object?>> response = await database!.query(
      SQLConstants.notesTable,
      where: '${SQLConstants.title}=${SQLConstants.query}', // "title = ?"
      whereArgs: [parameters.title],
    );
    return response.map((note) => NoteModel.fromJson(note)).toList();
  }
}
