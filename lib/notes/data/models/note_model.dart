import 'package:notes/core/local/sql_constants.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';

class NoteModel extends Note {
  const NoteModel({
    required super.id,
    required super.title,
    required super.details,
    required super.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> map) => NoteModel(
        id: map[SQLConstants.id],
        title: map[SQLConstants.title],
        details: map[SQLConstants.details],
        color: map[SQLConstants.color],
      );

}
