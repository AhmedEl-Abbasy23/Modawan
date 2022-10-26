part of 'search_note_bloc.dart';

abstract class NotesSearchEvent extends Equatable {
  const NotesSearchEvent();

  @override
  List<Object> get props => [];
}

class InitialSearchNoteEvent extends NotesSearchEvent {
  const InitialSearchNoteEvent();

  @override
  List<Object> get props => [];
}

class SearchNoteEvent extends NotesSearchEvent {
  final String title;

  const SearchNoteEvent({required this.title});

  @override
  List<Object> get props => [title];
}
