import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/app.dart';
import 'package:notes/core/bloc_observer.dart';
import 'package:notes/core/config/localize.dart';
import 'package:notes/core/services/init_database.dart';
import 'package:notes/core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await MyLocalization.localizationSetup();
  await SQLDatabase().initDatabase();
  Bloc.observer = MyBlocObserver();
  runApp(LocalizedApp(child: MyApp()));
}
