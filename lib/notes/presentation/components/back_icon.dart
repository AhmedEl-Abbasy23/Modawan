import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/config/localize.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_values.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorsDark.darkGrey,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: SvgPicture.asset(
        translator.activeLanguageCode == ENGLISH
            ? IconsAssets.arrowBack
            : IconsAssets.arrowForward,
      ),
    );
  }
}
