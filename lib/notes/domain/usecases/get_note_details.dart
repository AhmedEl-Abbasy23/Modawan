import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/core/error/failure.dart';
import 'package:notes/core/usecase/base_usecase.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/domain/repository/base_notes_repository.dart';

class GetNoteDetailsUseCase extends BaseUseCase<Note,GetNoteDetailsParameters>{
  final BaseNotesRepository baseNotesRepository;
  GetNoteDetailsUseCase(this.baseNotesRepository);

  @override
  Future<Either<Failure, Note>> call(GetNoteDetailsParameters parameters) async{
    return await baseNotesRepository.getNoteDetails(parameters);
  }

}

class GetNoteDetailsParameters extends Equatable {
  final int id;

  const GetNoteDetailsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}