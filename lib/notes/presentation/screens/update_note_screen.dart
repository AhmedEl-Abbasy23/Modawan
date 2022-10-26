import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/services/services_locator.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/notes/presentation/components/actions_padding.dart';
import 'package:notes/notes/presentation/components/back_icon.dart';
import 'package:notes/notes/presentation/components/confirm_dialog.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/rounded_icon_container.dart';
import 'package:notes/notes/presentation/components/add_update_note_body.dart';
import 'package:notes/notes/presentation/controller/update_note_controller/update_note_bloc.dart';

class UpdateNoteScreen extends StatelessWidget {
  UpdateNoteScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.details,
  }) : super(key: key);

  final int id;
  final String title;
  final String details;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backToNotesScreen(context);
        return Future(() => false);
      },
      child: BlocProvider(
        create: (BuildContext context) => sl<UpdateNoteBloc>()
          ..initTextControllers(title: title, details: details),
        child: BlocBuilder<UpdateNoteBloc, UpdateNoteState>(
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
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => ConfirmDialog(
                            title: AppStrings.updateNote.tr(),
                            greenBtnName: AppStrings.update.tr(),
                            onGreenPressed: () {
                              try {
                                context
                                    .read<UpdateNoteBloc>()
                                    .add(UpdateCurrentNoteEvent(
                                      id: id,
                                      title: context
                                          .read<UpdateNoteBloc>()
                                          .titleController!
                                          .text,
                                      details: context
                                          .read<UpdateNoteBloc>()
                                          .detailsController!
                                          .text,
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
                    icon: const RoundedAppBarIcon(icon: Icons.done),
                  ),
                  const ActionsPadding(),
                ],
              ),
              body: AddOrUpdateNoteBody(
                formKey: _formKey,
                titleController:
                    context.read<UpdateNoteBloc>().titleController!,
                detailsController:
                    context.read<UpdateNoteBloc>().detailsController!,
              ),
            );
          },
        ),
      ),
    );
  }

  void _backToNotesScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ConfirmDialog(
        title: AppStrings.discardChanges.tr(),
        greenBtnName: AppStrings.keep.tr(),
        // keep changes.
        onGreenPressed: () {
          Navigator.pop(context);
        },
        // discard changes.
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
