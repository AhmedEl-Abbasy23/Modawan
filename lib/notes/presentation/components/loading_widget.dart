import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/core/utils/app_assets.dart';
import 'package:notes/core/utils/app_values.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        JsonAssets.loading,
        height: AppSize.s285,
        width: AppSize.s285,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
