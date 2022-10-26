import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_values.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p200),
      child: Lottie.asset(
          JsonAssets.searching,
          height: AppSize.s285,
          width: AppSize.s285,
          fit: BoxFit.fitWidth,
      ),
    );
  }
}
