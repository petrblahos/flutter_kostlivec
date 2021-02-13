import 'package:hive/hive.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_kostlivec/src/util.dart';

///
/// Různé instance této třídy si drží odkaz na odpovídající stavový objekt.
///
class StateHolder<STATE> with ChangeNotifier {
  STATE _state;
  String _hiveBoxName;
  Box<STATE> _hiveBox;

  StateHolder(this._state, {String boxName}) : _hiveBoxName = boxName {
    log.warning("New StateHolder: $_state");
    if (_hiveBoxName != null) {
      Hive.openBox<STATE>(_hiveBoxName).then((var box) {
        _hiveBox = box;
        if (box.containsKey(0)) {
          _state = box.get(0);
          log.fine("State initialized from ${_hiveBoxName}");
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
      _hiveBox.put(0, _state);
    }
  }
}
