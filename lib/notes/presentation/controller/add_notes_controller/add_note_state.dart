part of 'add_note_bloc.dart';

abstract class AddNoteState extends Equatable {
  const AddNoteState();

  @override
  List<Object> get props => [];
}

class AddNoteInitial extends AddNoteState {
  @override
  List<Object> get props => [];
}

class SelectNoteColorState extends AddNoteState {
  const SelectNoteColorState();

  @override
  List<Object> get props => [];
}
