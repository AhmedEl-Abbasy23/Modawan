import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/usecases/search_note_usecase.dart';

part 'search_note_event.dart';

part 'search_note_state.dart';

class SearchNoteBloc extends Bloc<NotesSearchEvent, NotesSearchState> {
  final SearchNoteUseCase searchNoteUseCase;

  SearchNoteBloc(this.searchNoteUseCase) : super(const NotesSearchState()) {
    on<SearchNoteEvent>(_searchNote);
  }

  FutureOr<void> _searchNote(
      SearchNoteEvent event, Emitter<NotesSearchState> emit) async {
    final result =
        await searchNoteUseCase(SearchNoteParameters(title: event.title));
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
