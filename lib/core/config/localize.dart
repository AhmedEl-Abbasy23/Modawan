import 'package:localize_and_translate/localize_and_translate.dart';
const String assetPath = 'assets/locale/';
const String ARABIC = 'ar';
const String ENGLISH = 'en';
class MyLocalization {
  static localizationSetup() async{
    await translator.init(
      localeType: LocalizationDefaultType.device,
      languagesList: <String>[ARABIC, ENGLISH],
      assetsDirectory: assetPath,
    );
    // To check app language.
    // translator.activeLanguageCode != 'ar' ?
  }

  static changeLanguage(context) {
    translator.setNewLanguage(
      context,
      newLanguage: translator.activeLanguageCode == ARABIC ? ENGLISH : ARABIC,
      remember: true,
      restart: true,
    );
  }
}