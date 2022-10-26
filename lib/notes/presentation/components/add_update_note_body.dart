import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class AddOrUpdateNoteBody extends StatelessWidget {
  const AddOrUpdateNoteBody({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.detailsController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController detailsController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p10,
        horizontal: AppPadding.p16,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note title form.
            TextFormField(
              scrollPadding: EdgeInsets.zero,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              controller: titleController,
              cursorHeight: AppSize.s35,
              cursorColor: AppColorsDark.primary,
              maxLines: AppSize.si2,
              maxLength: AppSize.si60,
              maxLengthEnforcement:
                  MaxLengthEnforcement.truncateAfterCompositionEnds,
              style: getRegularStyle(
                color: AppColorsDark.primary,
                fontSize: FontSize.s32,
              ),
              validator: (String? value) {
                if (value!.length < AppSize.s3) {
                  return AppStrings.shortTitle.tr();
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: AppStrings.title.tr(),
                isCollapsed: true,
                enabledBorder: _outlineInputBorderStyle(),
                focusedBorder: _outlineInputBorderStyle(),
                errorBorder: _outlineInputBorderErrorStyle(),
                hintStyle: getRegularStyle(
                  color: AppColorsDark.offWhite,
                  fontSize: FontSize.s40,
                ),
                counterStyle: getLightStyle(
                  color: AppColorsDark.offWhite,
                ),
              ),
            ),
            // Note description form.
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              controller: detailsController,
              cursorHeight: AppSize.s22,
              cursorColor: AppColorsDark.primary,
              maxLines: AppSize.si8,
              maxLength: AppSize.si500,
              maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
              style: getRegularStyle(
                color: AppColorsDark.primary,
                fontSize: FontSize.s22,
              ),
              validator: (String? value) {
                if (value!.length < AppSize.s3) {
                  return AppStrings.shortDetails.tr();
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: AppStrings.typeSomething.tr(),
                isCollapsed: true,
                enabledBorder: _outlineInputBorderStyle(),
                focusedBorder: _outlineInputBorderStyle(),
                errorBorder: _outlineInputBorderErrorStyle(),
                hintStyle: getRegularStyle(
                  color: AppColorsDark.offWhite,
                  fontSize: FontSize.s22,
                ),
                counterStyle: getLightStyle(
                  color: AppColorsDark.offWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorderStyle() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: AppSize.s0,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorderErrorStyle() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorsDark.red,
        width: AppSize.s0,
      ),
    );
  }
}
