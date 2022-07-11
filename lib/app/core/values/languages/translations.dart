import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/values/languages/en-US.dart';
import 'package:food_nija_application/app/core/values/languages/vi-VN.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context){
    return Localizations.of<Translations>(context, Translations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': en_US,
    'vi': vi_VN,
  };

  String text(String key){
    return _localizedValues[locale.languageCode]![key] ?? 'error because ${key} not found';
  }
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi',].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(Translations(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}