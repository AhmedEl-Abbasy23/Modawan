import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/config/localize.dart';
import 'package:notes/core/services/services_locator.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_values.dart';
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/presentation/components/actions_padding.dart';
import 'package:notes/notes/presentation/components/loading_widget.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/notes_empty.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/notes_list.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/rounded_icon_container.dart';
import 'package:notes/notes/presentation/controller/notes_controller/notes_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotesBloc>()..add(const GetNotesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.notes.tr()),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.searchScreen);
              },
              icon: const RoundedAppBarIcon(icon: Icons.search),
            ),
            IconButton(
              onPressed: () {
                MyLocalization.changeLanguage(context);
              },
              icon: const RoundedAppBarIcon(icon: Icons.language),
            ),
            const ActionsPadding(),
          ],
        ),
        body: SizedBox(
          height: mediaQueryHeight(context),
          width: mediaQueryWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p10,
              horizontal: AppPadding.p16,
            ),
            child: BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                switch (state.dataState) {
                  case DataState.loading:
                    return const Loading();
                  case DataState.loaded:
                    if (state.notes.isNotEmpty) {
                      return NotesList(notes: state.notes);
                    } else {
                      return const NotesEmpty();
                    }
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.addNoteScreen);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
