import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/notes/domain/usecases/delete_note_usecase.dart';

part 'delete_note_event.dart';

part 'delete_note_state.dart';

class DeleteNoteBloc extends Bloc<DeleteNoteEvent, DeleteNoteState> {
  final DeleteNoteUseCase deleteNoteUseCase;

  DeleteNoteBloc(this.deleteNoteUseCase) : super(DeleteNoteInitial()) {
    on<DeleteCurrentNoteEvent>(_deleteNote);
  }

  FutureOr<void> _deleteNote(
      DeleteCurrentNoteEvent event, Emitter<DeleteNoteState> emit) async {
    await deleteNoteUseCase(DeleteNoteParameters(id: event.id));
  }
}
