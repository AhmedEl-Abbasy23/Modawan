import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/notes/domain/usecases/update_note_usecase.dart';

part 'update_note_event.dart';

part 'update_note_state.dart';

class UpdateNoteBloc extends Bloc<UpdateNoteEvent, UpdateNoteState> {
  final UpdateNoteUseCase updateNoteUseCase;

  UpdateNoteBloc(this.updateNoteUseCase) : super(UpdateNoteInitial()) {
    on<UpdateCurrentNoteEvent>(_updateNote);
  }

  TextEditingController? titleController;
  TextEditingController? detailsController;

  // to use initialValue & controllers in the same time.
  initTextControllers({required String title, required String details}) {
    titleController = TextEditingController(text: title);
    detailsController = TextEditingController(text: details);
  }

  FutureOr<void> _updateNote(
      UpdateCurrentNoteEvent event, Emitter<UpdateNoteState> emit) async {
    await updateNoteUseCase(UpdateNoteParameters(
      id: event.id,
      title: event.title,
      details: event.details,
    ));
  }
}
