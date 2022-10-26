class NoteDetailsArguments {
  final int id;

  const NoteDetailsArguments({required this.id});
}

class UpdateNoteArguments {
  final int id;
  final String title;
  final String details;

  UpdateNoteArguments({
    required this.id,
    required this.title,
    required this.details,
  });
}
