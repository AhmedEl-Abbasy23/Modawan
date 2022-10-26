import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/config/responsive_app.dart';
import 'package:notes/core/global/themes/dark_theme.dart';
import 'package:notes/core/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates,
      locale: translator.activeLocale,
      supportedLocales: translator.locals(),
      onGenerateRoute: RouteGenerator.getRoute,
      theme: darkTheme,
      builder: (context, widget) => MyResponsiveApp.responsiveSetup(widget),
    );
  }
}
