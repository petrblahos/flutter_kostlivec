import 'package:flutter/material.dart' show Locale;
import 'package:flutter_kostlivec/src/i69n/locales.dart' as locales;
import 'package:hive/hive.dart';

import 'package:flutter_kostlivec/src/build_flavor.dart';

part 'config_state.g.dart';

///
/// Nastaveni aplikace, aktualni locale, mozna i dalsi preference.
///
@HiveType(typeId: 3)
class ConfigState {
  @HiveField(0)
  BuildFlavor _mode;

  @HiveField(1)
  String _language;

  BuildFlavor get mode => _mode;
  Locale get locale => locales.findNearestLocale(Locale(_language));

  ConfigState() {
    _mode = BuildFlavor.PROD;
    _language = locales.detectLocale().languageCode;
  }

  ConfigState.build(BuildFlavor m, String l) {
    _mode = m;
    _language = l;
  }
}
