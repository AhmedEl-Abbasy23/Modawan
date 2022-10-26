part of 'search_note_bloc.dart';

class NotesSearchState extends Equatable {
  final List<Note> notes;
  final String errorMessage;
  final DataState dataState;

  const NotesSearchState({
    this.notes = const [],
    this.errorMessage = '',
    this.dataState = DataState.loading,
  });

  NotesSearchState copyWith({
    List<Note>? notes,
    String? errorMessage,
    DataState? dataState,
  }) {
    return NotesSearchState(
      notes: notes ?? this.notes,
      errorMessage: errorMessage ?? this.errorMessage,
      dataState: dataState ?? this.dataState,
    );
  }

  @override
  List<Object> get props => [identityHashCode(this)];
}
