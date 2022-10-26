part of 'add_note_bloc.dart';

abstract class AddNoteEvent extends Equatable {
  const AddNoteEvent();

  @override
  List<Object> get props => [];
}

class InitialAddNoteEvent extends AddNoteEvent {
  const InitialAddNoteEvent();

  @override
  List<Object> get props => [];
}

class SelectNoteColorEvent extends AddNoteEvent {
  final Color noteColor;

  const SelectNoteColorEvent({required this.noteColor});

  @override
  List<Object> get props => [noteColor];
}

class AddNewNoteEvent extends AddNoteEvent {
  final String title;
  final String details;
  final String color;

  const AddNewNoteEvent({
    required this.title,
    required this.details,
    required this.color,
  });

  @override
  List<Object> get props => [title, details, color];
}
