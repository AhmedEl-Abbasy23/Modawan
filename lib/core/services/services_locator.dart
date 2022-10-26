import 'package:get_it/get_it.dart';
import 'package:notes/notes/data/datasource/notes_local_database.dart';
import 'package:notes/notes/data/repository/notes_repository.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';
import 'package:notes/notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/notes/domain/usecases/get_note_details.dart';
import 'package:notes/notes/domain/usecases/get_notes_usecase.dart';
import 'package:notes/notes/domain/usecases/search_note_usecase.dart';
import 'package:notes/notes/domain/usecases/update_note_usecase.dart';
import 'package:notes/notes/presentation/controller/add_notes_controller/add_note_bloc.dart';
import 'package:notes/notes/presentation/controller/delete_note_controller/delete_note_bloc.dart';
import 'package:notes/notes/presentation/controller/note_details_controller/note_details_bloc.dart';
import 'package:notes/notes/presentation/controller/notes_controller/notes_bloc.dart';
import 'package:notes/notes/presentation/controller/search_note_controller/search_note_bloc.dart';
import 'package:notes/notes/presentation/controller/update_note_controller/update_note_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    sl.registerFactory<NotesBloc>(() => NotesBloc(sl()));
    sl.registerFactory<AddNoteBloc>(() => AddNoteBloc(sl()));
    sl.registerFactory<DeleteNoteBloc>(() => DeleteNoteBloc(sl()));
    sl.registerFactory<NoteDetailsBloc>(() => NoteDetailsBloc(sl()));
    sl.registerFactory<UpdateNoteBloc>(() => UpdateNoteBloc(sl()));
    sl.registerFactory<SearchNoteBloc>(() => SearchNoteBloc(sl()));
    // Use Cases
    sl.registerLazySingleton<GetNotesUseCase>(
            () => GetNotesUseCase(sl()));
    sl.registerLazySingleton<AddNoteUseCase>(
            () => AddNoteUseCase(sl()));
    sl.registerLazySingleton<DeleteNoteUseCase>(
            () => DeleteNoteUseCase(sl()));
    sl.registerLazySingleton<GetNoteDetailsUseCase>(
            () => GetNoteDetailsUseCase(sl()));
    sl.registerLazySingleton<UpdateNoteUseCase>(
            () => UpdateNoteUseCase(sl()));
    sl.registerLazySingleton<SearchNoteUseCase>(
            () => SearchNoteUseCase(sl()));
    // Repository
    sl.registerLazySingleton<BaseNotesRepository>(
            () => NotesRepository(sl()));
    // Data Source
    sl.registerLazySingleton<BaseNotesLocalDataSource>(
        () => NotesLocalDataSource());

  }
}
