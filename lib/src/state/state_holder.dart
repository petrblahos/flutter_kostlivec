import 'dart:ui' show VoidCallback;
import 'package:hive/hive.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_kostlivec/src/util.dart';
import 'package:flutter_kostlivec/src/state/serializers.dart';

///
/// Různé instance této třídy si drží odkaz na odpovídající stavový objekt.
///
class StateHolder<STATE> with ChangeNotifier {
  STATE _state;
  final String _hiveBoxName;
  Box _hiveBox;

  StateHolder(this._state, {String boxName, VoidCallback onLoad}) : _hiveBoxName = boxName {
    if (_hiveBoxName != null) {
      Hive.openBox(_hiveBoxName).then((var box) {
        _hiveBox = box;
        if (box.containsKey(0)) {
          var data = box.get(0);
          _state = serializers.deserialize(data);
          log.info("State initialized from $_hiveBoxName");
          if (null != onLoad) {
            onLoad();
          }
          notifyListeners();
        }
      });
    }
  }

  STATE get state => _state;

  set state(STATE value) {
    _state = value;
    log.fine("State changed");
    notifyListeners();

    if (_hiveBox != null) {
      log.fine("Saving state to $_hiveBoxName");
      _hiveBox.put(0, serializers.serialize(_state));
    }
  }
}
