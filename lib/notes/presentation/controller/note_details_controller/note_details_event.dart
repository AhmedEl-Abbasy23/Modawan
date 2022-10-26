part of 'note_details_bloc.dart';

abstract class NoteDetailsEvent extends Equatable {
  const NoteDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialNoteDetailsEvent extends NoteDetailsEvent {
  const InitialNoteDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetNoteDetailsEvent extends NoteDetailsEvent {
  final int id;

  const GetNoteDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
