import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/notes/domain/usecases/add_note_usecase.dart';

part 'add_note_event.dart';

part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final AddNoteUseCase addNoteUseCase;

  AddNoteBloc(this.addNoteUseCase) : super(AddNoteInitial()) {
    on<SelectNoteColorEvent>(_selectNoteColor);
    on<AddNewNoteEvent>(_addNote);
  }

  Color noteColor = AppColorsDark.green;

  _selectNoteColor(SelectNoteColorEvent event, Emitter<AddNoteState> emit) {
    noteColor = event.noteColor;
    emit(const SelectNoteColorState());
  }

  FutureOr<void> _addNote(AddNewNoteEvent event, Emitter<AddNoteState> emit) async {
    await addNoteUseCase(AddNoteParameters(
      title: event.title,
      details: event.details,
      color: event.color,
    ));
  }
}
