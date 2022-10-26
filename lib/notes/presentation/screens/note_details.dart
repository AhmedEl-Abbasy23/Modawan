import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/services/services_locator.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/argument_models.dart';
import 'package:notes/core/utils/enums.dart';
import 'package:notes/notes/presentation/components/actions_padding.dart';
import 'package:notes/notes/presentation/components/back_icon.dart';
import 'package:notes/notes/presentation/components/loading_widget.dart';
import 'package:notes/notes/presentation/components/note_details_widgets/note_details_body.dart';
import 'package:notes/notes/presentation/components/notes_screen_widgets/rounded_icon_container.dart';
import 'package:notes/notes/presentation/controller/note_details_controller/note_details_bloc.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacementNamed(
          context,
          Routes.notesScreen,
        );
        return Future(() => false);
      },
      child: BlocProvider(
        create: (BuildContext context) =>
            sl<NoteDetailsBloc>()..add(GetNoteDetailsEvent(id: id)),
        child: BlocBuilder<NoteDetailsBloc, NoteDetailsState>(
          buildWhen: (previous, current) {
            return previous.dataState != current.dataState;
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.notesScreen,
                    );
                  },
                  icon: const BackIcon(),
                ),
                actions: [
                  IconButton(
                    icon: const RoundedAppBarIcon(icon: Icons.edit),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.updateNoteScreen,
                        arguments: UpdateNoteArguments(
                          id: state.note!.id,
                          title: state.note!.title,
                          details: state.note!.details,
                        ),
                      );
                    },
                  ),
                  const ActionsPadding(),
                ],
              ),
              body: state.dataState == DataState.loading
                  ? const Loading()
                  : NoteDetailsBody(
                      title: state.note!.title,
                      details: state.note!.details,
                    ),
            );
          },
        ),
      ),
    );
  }
}
