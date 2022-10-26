import 'package:flutter/material.dart';
import 'package:notes/core/global/colors/app_colors_dark.dart';
import 'package:notes/core/utils/app_values.dart';

class RoundedAppBarIcon extends StatelessWidget {
  const RoundedAppBarIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColorsDark.darkGrey,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Icon(icon, size: AppSize.s28),
    );
  }
}
