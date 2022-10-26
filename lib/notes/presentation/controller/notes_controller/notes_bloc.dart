import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/usecases/get_notes_usecase.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase getNotesUseCase;

  NotesBloc(this.getNotesUseCase) : super(const NotesState()) {
    on<GetNotesEvent>(_getNotes);
  }

  FutureOr<void> _getNotes(GetNotesEvent event, Emitter<NotesState> emit) async {
    final result = await getNotesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.message,
          dataState: DataState.loading,
        ),
      ),
      (r) => emit(
        state.copyWith(
          notes: r,
          dataState: DataState.loaded,
        ),
      ),
    );
  }
}
