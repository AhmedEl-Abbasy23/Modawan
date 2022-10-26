import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class NoteNotFound extends StatelessWidget {
  const NoteNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p200),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(
              ImageAssets.searchingSvg,
              height: AppSize.s300,
              width: AppSize.s300,
              fit: BoxFit.cover,
          ),
          Text(
              textAlign: TextAlign.center,
              AppStrings.noteNotFound.tr(),
              style: getLightStyle(
                fontSize: FontSize.s18,
                color: AppColorsDark.primary,
              ),
          ),
        ],
      ),
    );
  }
}