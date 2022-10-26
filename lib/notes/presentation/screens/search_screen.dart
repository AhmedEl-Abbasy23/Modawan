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
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/presentation/components/search_screen_widgets/note_not_found_widget.dart';
import 'package:notes/notes/presentation/components/search_screen_widgets/search_empty_widget.dart';
import 'package:notes/notes/presentation/components/search_screen_widgets/search_notes_widget.dart';
import 'package:notes/notes/presentation/controller/search_note_controller/search_note_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.notesScreen,
        );
        return Future(() => false);
      },
      child: BlocProvider(
        create: (context) => sl<SearchNoteBloc>(),
        child: Scaffold(
          body: SizedBox(
            height: mediaQueryHeight(context),
            width: mediaQueryWidth(context),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p60,
                horizontal: AppPadding.p14,
              ),
              child: BlocBuilder<SearchNoteBloc, NotesSearchState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mediaQueryHeight(context) / AppSize.s18,
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: AppSize.si1,
                          cursorColor: AppColorsDark.primary,
                          style: getRegularStyle(
                            color: AppColorsDark.primary,
                            fontSize: FontSize.s20,
                          ),
                          onChanged: (String? value) {
                            context
                                .read<SearchNoteBloc>()
                                .add(SearchNoteEvent(title: value!));
                          },
                          onFieldSubmitted: (String? value) {
                            context
                                .read<SearchNoteBloc>()
                                .add(SearchNoteEvent(title: value!));
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p12),
                            hintText: AppStrings.searchByKeyword.tr(),
                            filled: true,
                            fillColor: AppColorsDark.darkGrey,
                            isCollapsed: true,
                            enabledBorder: _outlineInputBorderStyle(),
                            focusedBorder: _outlineInputBorderStyle(),
                            errorBorder: _outlineInputBorderErrorStyle(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.notesScreen,
                                );
                              },
                              icon: const Icon(Icons.close),
                            ),
                            suffixIconColor: AppColorsDark.primary,
                            hintStyle: getRegularStyle(
                              color: AppColorsDark.offWhite,
                              fontSize: FontSize.s22,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: state.dataState == DataState.loading
                            ? const SearchEmpty()
                            : state.notes.isEmpty
                                ? const NoteNotFound()
                                : SearchNotes(notes: state.notes),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s30),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: AppSize.s0,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorderErrorStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s30),
      borderSide: const BorderSide(
        color: AppColorsDark.red,
        width: AppSize.s0,
      ),
    );
  }
}
