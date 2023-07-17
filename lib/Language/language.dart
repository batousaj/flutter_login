import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LanguageManager {
  static final localeList = [
    const Locale('en'),
    const Locale('vi'),
  ];

  static final delegateList = [
    AppLocalizations.delegate, // Add this line
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

extension LocalizeContext on BuildContext {
  AppLocalizations localizeString() {
    if (AppLocalizations.of(this) != null) {
      return AppLocalizations.of(this)!;
    } else {
      var locale = const Locale('vi');
      return lookupAppLocalizations(locale);
    }
  }
}
