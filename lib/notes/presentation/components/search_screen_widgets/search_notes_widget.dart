import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';
import 'package:notes/core/utils/argument_models.dart';
import 'package:notes/notes/domain/entities/note_entity.dart';

class SearchNotes extends StatelessWidget {
  const SearchNotes({Key? key, required this.notes}) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQueryHeight(context),
      width: mediaQueryWidth(context),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m6),
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
              );
        },
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
