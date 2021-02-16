///
/// Environment - production or test?
///
/// See:
/// main_prod.dart
/// main_test.dart
///
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'build_flavor.g.dart';

class BuildFlavor extends EnumClass {
  static Serializer<BuildFlavor> get serializer => _$buildFlavorSerializer;

  static const BuildFlavor PROD = _$PROD;
  static const BuildFlavor TEST = _$TEST;

  const BuildFlavor._(String name) : super(name);

  static BuiltSet<BuildFlavor> get values => _$values;
  static BuildFlavor valueOf(String name) => _$valueOf(name);
}
