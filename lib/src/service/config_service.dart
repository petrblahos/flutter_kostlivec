import 'package:flutter/cupertino.dart';
import 'package:flutter_kostlivec/src/build_flavor.dart';
import 'package:flutter_kostlivec/src/i69n/locales.dart' as locales;
import 'package:flutter_kostlivec/src/i69n/messages.i69n.dart';
import 'package:flutter_kostlivec/src/state/config_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

///
/// Metody pro manipulaci s ConfigState. Až přidáš další stav, asi budeš chtít
/// přidat i další service.
///
/// Servisní metody by asi většinou neměly vracet data, data by se měla objevit ve stavovém objektu.
///
///
class ConfigService {
  StateHolder<ConfigState> get holder => getMy<StateHolder<ConfigState>>();

  ConfigState prepareDefaultState(BuildFlavor mode) {
    return ConfigState.build(mode, locales.detectLocale().languageCode);
  }

  ///
  /// Nastav jazyk / locale.
  ///
  void setLocale(String lang) {
    Locale locale = locales.findNearestLocale(Locale(lang));
    log.info("setLocale Messages changed to $locale");
    getMy<StateHolder<Messages>>().state = locales.getMessagesByLocale(locale);
    holder.state = ConfigState.build(holder.state.mode, locale.languageCode);
  }

  ///
  /// Nastav jazyk / locale.
  ///
  void updateLocale() {
    Locale locale = holder.state.locale;
    log.info("updateLocale Messages changed to $locale");
    getMy<StateHolder<Messages>>().state = locales.getMessagesByLocale(locale);
  }
}
