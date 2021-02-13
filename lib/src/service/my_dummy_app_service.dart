import 'package:flutter_kostlivec/src/build_flavor.dart';
import 'package:flutter_kostlivec/src/state/my_dummy_app_state.dart';
import 'package:flutter_kostlivec/src/state/state_holder.dart';
import 'package:flutter_kostlivec/src/util.dart';

///
/// Metody pro manipulaci s MyDummyAppState. Až přidáš další stav, asi budeš chtít
/// přidat i další service.
///
/// Servisní metody by asi většinou neměly vracet data, data by se měla objevit ve stavovém objektu.
///
///
class MyDummyAppService {
  StateHolder<MyDummyAppState> get holder => getMy<StateHolder<MyDummyAppState>>();

  MyDummyAppState prepareDefaultState(BuildFlavor mode) {
    return MyDummyAppState();
  }

  ///
  /// Demo metoda - zvedni pocitadlo.
  ///
  void incrementCounter() {
    List<String> l = List.from(holder.state.items);
    l.add("Item: ${DateTime.now()}");
    holder.state = MyDummyAppState.build(holder.state.counter + 1, l);
  }

  void deleteItem(int index) {
    List<String> l = List.from(holder.state.items);
    l.removeAt(index);
    holder.state = MyDummyAppState.build(holder.state.counter, l);
  }
}
