import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/argument_models.dart';
import 'package:notes/notes/presentation/screens/add_note_screen.dart';
import 'package:notes/notes/presentation/screens/note_details.dart';
import 'package:notes/notes/presentation/screens/notes_screen.dart';
import 'package:notes/notes/presentation/screens/search_screen.dart';
import 'package:notes/notes/presentation/screens/splash_screen.dart';
import 'package:notes/notes/presentation/screens/update_note_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String notesScreen = '/notesScreen';
  static const String addNoteScreen = '/addNoteScreen';
  static const String noteDetailsScreen = '/noteDetailsScreen';
  static const String updateNoteScreen = '/updateNoteScreen';
  static const String searchScreen = '/searchScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.notesScreen:
        return MaterialPageRoute(builder: (_) => const NotesScreen());
      case Routes.addNoteScreen:
        return MaterialPageRoute(builder: (_) => AddNoteScreen());
      case Routes.noteDetailsScreen:
        return MaterialPageRoute(builder: (_) {
          // Receive arguments from navigation.
          final args = routeSettings.arguments as NoteDetailsArguments;
          return NoteDetailsScreen(id: args.id);
        });
      case Routes.updateNoteScreen:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as UpdateNoteArguments;
          return UpdateNoteScreen(
            id: args.id,
            title: args.title,
            details: args.details,
          );
        });
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.wrongScreen),
        ),
        body: const Center(child: Text(AppStrings.routeNotFound)),
      ),
    );
  }
}
