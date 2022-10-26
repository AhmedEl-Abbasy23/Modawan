import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/usecases/get_note_details.dart';

part 'note_details_event.dart';

part 'note_details_state.dart';

class NoteDetailsBloc extends Bloc<NoteDetailsEvent, NoteDetailsState> {
  final GetNoteDetailsUseCase getNoteByIdUseCase;

  NoteDetailsBloc(this.getNoteByIdUseCase) : super(const NoteDetailsState()) {
    on<GetNoteDetailsEvent>(_getNoteDetails);
  }

  FutureOr<void> _getNoteDetails(
      GetNoteDetailsEvent event, Emitter<NoteDetailsState> emit) async {
    final result =
        await getNoteByIdUseCase(GetNoteDetailsParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          dataState: DataState.loading,
          errorMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          dataState: DataState.loaded,
          note: r,
        ),
      ),
    );
  }
}
