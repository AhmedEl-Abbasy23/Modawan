import 'package:flutter/material.dart';
import 'app_fonts.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

// light text style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

// medium text style
TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

// semi-Bold text style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

// bold text style
TextStyle getBoldStyle({
  double fontSize = FontSize.s18,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

// bold text style
TextStyle getBlackStyle({
  double fontSize = FontSize.s18,
  Color color = Colors.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.black,
    color: color,
  );
}
