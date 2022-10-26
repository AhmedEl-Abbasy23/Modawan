import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class NotesEmpty extends StatelessWidget {
  const NotesEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(
            ImageAssets.notebookSvg,
            height: AppSize.s400,
            width: AppSize.s400,
            fit: BoxFit.cover,
          ),
          Text(
            AppStrings.createFirstNote.tr(),
            style: getLightStyle(
              fontSize: FontSize.s24,
              color: AppColorsDark.primary,
            ),
          ),
        ],
      ),
    );
  }
}
