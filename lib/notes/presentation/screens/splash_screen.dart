import 'dart:async';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
      const Duration(milliseconds: DurationConstant.d3000),
      _goNext,
    );
  }

  // Navigate to home screen.
  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.notesScreen);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: mediaQueryHeight(context),
        width: mediaQueryWidth(context),
        padding: const EdgeInsets.all(AppPadding.p70),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColorsDark.lightBlack),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Lottie.asset(
              JsonAssets.splashNotes,
              height: AppSize.s270,
              width: AppSize.s270,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
            Text(
              AppStrings.appName.tr(),
              style: getBoldStyle(
                fontSize: FontSize.s28,
                color: AppColorsDark.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
