import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/services/services_locator.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';
import 'package:notes/core/utils/argument_models.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';
import 'package:notes/notes/presentation/controller/delete_note_controller/delete_note_bloc.dart';
import 'package:notes/notes/presentation/controller/notes_controller/notes_bloc.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key, required this.notes}) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeleteNoteBloc>(),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return BlocBuilder<DeleteNoteBloc, DeleteNoteState>(
            builder: (context, state) {
              return Dismissible(
                background: _dismissibleBG(),
                key: Key(notes[index].id.toString()),
                onDismissed: (direction) {
                  context.read<DeleteNoteBloc>().add(DeleteCurrentNoteEvent(id: notes[index].id));
                  context.read<NotesBloc>().add(const GetNotesEvent());
                  ScaffoldMessenger.of(context).showSnackBar(_showSnackBar(index));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                  height: mediaQueryHeight(context) / AppSize.s8,
                  width: mediaQueryWidth(context),
                  decoration: BoxDecoration(
                    color: Color(int.parse(notes[index].color)),
                    borderRadius: BorderRadius.circular(AppSize.s14),
                  ),
                  child: ContentListTile(
                    noteId: notes[index].id,
                    title: notes[index].title,
                    details: notes[index].details,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container _dismissibleBG() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      decoration: BoxDecoration(
        color: AppColorsDark.red,
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      child: const Icon(
        Icons.delete,
        color: AppColorsDark.primary,
        size: AppSize.s50,
      ),
    );
  }

  SnackBar _showSnackBar(int index) {
    return SnackBar(
      content: Text(
        '${notes[index].title} ${AppStrings.deleted.tr()}',
        style: getRegularStyle(
          color: AppColorsDark.primary,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}

class ContentListTile extends StatelessWidget {
  const ContentListTile({
    Key? key,
    required this.noteId,
    required this.title,
    required this.details,
  }) : super(key: key);
  final int noteId;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      style: ListTileStyle.drawer,
      title: Text(
        title,
        maxLines: AppSize.si2,
        overflow: TextOverflow.ellipsis,
        style: getRegularStyle(
          fontSize: FontSize.s26,
        ),
      ),
      subtitle: Text(
        details,
        maxLines: AppSize.si1,
        overflow: TextOverflow.ellipsis,
        style: getRegularStyle(
          fontSize: FontSize.s22,
        ),
      ),
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.noteDetailsScreen,
          arguments: NoteDetailsArguments(id: noteId),
        );
      },
    );
  }
}
