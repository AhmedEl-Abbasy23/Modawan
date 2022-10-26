part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent extends Equatable {
  const NotesEvent();
}

class InitialNotesEvent extends NotesEvent {
  const InitialNotesEvent();

  @override
  List<Object> get props => [];
}

class GetNotesEvent extends NotesEvent {
  const GetNotesEvent();

  @override
  List<Object> get props => [];
}

