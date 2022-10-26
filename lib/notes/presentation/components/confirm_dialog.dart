import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_fonts.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/core/utils/app_values.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.greenBtnName,
    required this.onGreenPressed,
    required this.onRedPressed,
  }) : super(key: key);
  final String title;
  final String greenBtnName;
  final VoidCallback onGreenPressed;
  final VoidCallback onRedPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: AppColorsDark.lightBlack,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actionsPadding: const EdgeInsets.only(bottom: AppPadding.p20),
        icon: const Icon(Icons.info, size: AppSize.s40),
        iconColor: AppColorsDark.darkGrey,
        iconPadding: const EdgeInsets.only(top: AppPadding.p16, bottom: AppPadding.p10),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: getRegularStyle(
            fontSize: FontSize.s26,
            color: AppColorsDark.offWhite,
          ),
        ),
        actions: [
          ActionButton(
            onPressed: onRedPressed,
            buttonColor: AppColorsDark.red,
            buttonName: AppStrings.discard.tr(),
          ),
          ActionButton(
            onPressed: onGreenPressed,
            buttonColor: AppColorsDark.green,
            buttonName: greenBtnName,
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
        ));
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonName,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40,
      width: AppSize.s110,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Text(
          buttonName,
          style: getRegularStyle(
            fontSize: FontSize.s20,
            color: AppColorsDark.primary,
          ),
        ),
      ),
    );
  }
}
