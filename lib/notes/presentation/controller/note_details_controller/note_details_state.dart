part of 'note_details_bloc.dart';

class NoteDetailsState extends Equatable {
  final Note? note;
  final DataState dataState;
  final String errorMessage;

  const NoteDetailsState({
    this.note,
    this.dataState = DataState.loading,
    this.errorMessage = '',
  });

  NoteDetailsState copyWith({
    Note? note,
    DataState? dataState,
    String? errorMessage,
  }) {
    return NoteDetailsState(
      note: note ?? this.note,
      dataState: dataState ?? this.dataState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [identityHashCode(this)];
}
