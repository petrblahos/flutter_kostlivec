import 'dart:collection';

import 'package:hive/hive.dart';

part 'my_dummy_app_state.g.dart';

///
/// Dummy ukazka business logiky.
///
@HiveType(typeId: 1)
class MyDummyAppState {
  @HiveField(0)
  int _counter;

  @HiveField(1)
  List<String> _items;

  MyDummyAppState() {
    _counter = 1;
    _items = [];
  }
  MyDummyAppState.build(int c, List<String> l) {
    _counter = c;
    _items = List<String>.from(l);
  }

  int get counter => _counter;
  ListBase<String> get items => UnmodifiableListView<String>(_items);
}
