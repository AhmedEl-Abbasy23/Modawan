part of 'notes_bloc.dart';

@immutable
class NotesState extends Equatable {
  final List<Note> notes;
  final String errorMessage;
  final DataState dataState;

  const NotesState({
    this.notes = const [],
    this.errorMessage = '',
    this.dataState = DataState.loading,
  });

  // to avoid duplicate data.
  NotesState copyWith({
    List<Note>? notes,
    String? errorMessage,
    DataState? dataState,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      errorMessage: errorMessage ?? this.errorMessage,
      dataState: dataState ?? this.dataState,
    );
  }

  @override
  List<Object> get props => [identityHashCode(this)];
}
