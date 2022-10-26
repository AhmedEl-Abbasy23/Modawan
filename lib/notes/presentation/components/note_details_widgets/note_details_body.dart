import 'package:flutter/material.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class NoteDetailsBody extends StatelessWidget {
  const NoteDetailsBody({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
        horizontal: AppPadding.p16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getRegularStyle(
              color: AppColorsDark.primary,
              fontSize: FontSize.s32,
            ),
          ),
          SizedBox(height: mediaQueryHeight(context) / AppSize.s90),
          Text(
            details,
            style: getLightStyle(
              color: AppColorsDark.primary,
              fontSize: FontSize.s22,
            ),
          ),
        ],
      ),
    );
  }
}
