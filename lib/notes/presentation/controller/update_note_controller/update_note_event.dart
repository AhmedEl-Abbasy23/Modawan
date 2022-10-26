part of 'update_note_bloc.dart';

abstract class UpdateNoteEvent extends Equatable {
  const UpdateNoteEvent();

  @override
  List<Object> get props => [];
}

class InitialUpdateNoteEvent extends UpdateNoteEvent {
  const InitialUpdateNoteEvent();

  @override
  List<Object> get props => [];
}

class UpdateCurrentNoteEvent extends UpdateNoteEvent {
  final int id;
  final String title;
  final String details;

  const UpdateCurrentNoteEvent({
    required this.id,
    required this.title,
    required this.details,
  });

  @override
  List<Object> get props => [id, title, details];
}
