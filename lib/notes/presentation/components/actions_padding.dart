import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_values.dart';

class ActionsPadding extends StatelessWidget {
  const ActionsPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: mediaQueryWidth(context) / AppSize.s50);
  }
}
