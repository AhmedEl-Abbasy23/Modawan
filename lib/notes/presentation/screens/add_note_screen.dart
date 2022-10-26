import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/config/localize.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/services/services_locator.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/notes/presentation/components/actions_padding.dart';
import 'package:notes/notes/presentation/components/back_icon.dart';
import 'package:notes/notes/presentation/components/confirm_dialog.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/rounded_icon_container.dart';
import 'package:notes/notes/presentation/components/add_update_note_body.dart';
import 'package:notes/notes/presentation/controller/add_notes_controller/add_note_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backToNotesScreen(context);
        return Future(() => false);
      },
      child: BlocProvider(
        create: (BuildContext context) => sl<AddNoteBloc>(),
        child: BlocBuilder<AddNoteBloc, AddNoteState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    _backToNotesScreen(context);
                  },
                  icon: const BackIcon(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: AppColorsDark.lightBlack,
                            actions: [
                              ActionButton(
                                buttonName: AppStrings.done.tr(),
                                buttonColor: AppColorsDark.green,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            title: Text(
                              AppStrings.selectNoteColor.tr(),
                              style: getRegularStyle(
                                fontSize: FontSize.s22,
                                color: AppColorsDark.primary,
                              ),
                            ),
                            content: BlockPicker(
                              pickerColor: AppColorsDark.noteColors.first,
                              availableColors: AppColorsDark.noteColors,
                              useInShowDialog: true,
                              onColorChanged: (Color color) {
                                context.read<AddNoteBloc>().add(
                                    SelectNoteColorEvent(noteColor: color));
                              },
                            ),
                          );
                        },
                      );
                    },
                    icon: const RoundedAppBarIcon(
                      icon: Icons.color_lens_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => ConfirmDialog(
                            title: AppStrings.saveNote.tr(),
                            greenBtnName: AppStrings.save.tr(),
                            onGreenPressed: () {
                              try {
                                context.read<AddNoteBloc>().add(AddNewNoteEvent(
                                      title: _titleController.text,
                                      details: _detailsController.text,
                                      color:
                                          '${AppStrings.zeroXCode}${colorToHex(context.read<AddNoteBloc>().noteColor)}',
                                    ));
                              } finally {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.notesScreen,
                                  (route) => false,
                                );
                              }
                            },
                            onRedPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }
                    },
                    icon: const RoundedAppBarIcon(icon: Icons.save_outlined),
                  ),
                  const ActionsPadding(),
                ],
              ),
              body: AddOrUpdateNoteBody(
                formKey: _formKey,
                titleController: _titleController,
                detailsController: _detailsController,
              ),
            );
          },
        ),
      ),
    );
  }

  void _backToNotesScreen(BuildContext context) {
    if (_titleController.text.isEmpty && _detailsController.text.isEmpty) {
      Navigator.pushReplacementNamed(
        context,
        Routes.notesScreen,
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => ConfirmDialog(
          title: AppStrings.discardChanges.tr(),
          greenBtnName: AppStrings.keep.tr(),
          // to keep.
          onGreenPressed: () {
            Navigator.pop(context);
          },
          onRedPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.notesScreen,
              (route) => false,
            );
          },
        ),
      );
    }
  }
}
