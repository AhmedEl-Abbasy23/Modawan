part of 'delete_note_bloc.dart';

abstract class DeleteNoteEvent extends Equatable {
  const DeleteNoteEvent();

  @override
  List<Object> get props => [];
}

class InitialDeleteNoteEvent extends DeleteNoteEvent {
  const InitialDeleteNoteEvent();

  @override
  List<Object> get props => [];
}

class DeleteCurrentNoteEvent extends DeleteNoteEvent {
  final int id;

  const DeleteCurrentNoteEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
