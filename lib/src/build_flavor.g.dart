// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_flavor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BuildFlavor _$PROD = const BuildFlavor._('PROD');
const BuildFlavor _$TEST = const BuildFlavor._('TEST');

BuildFlavor _$valueOf(String name) {
  switch (name) {
    case 'PROD':
      return _$PROD;
    case 'TEST':
      return _$TEST;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BuildFlavor> _$values =
    new BuiltSet<BuildFlavor>(const <BuildFlavor>[
  _$PROD,
  _$TEST,
]);

Serializer<BuildFlavor> _$buildFlavorSerializer = new _$BuildFlavorSerializer();

class _$BuildFlavorSerializer implements PrimitiveSerializer<BuildFlavor> {
  @override
  final Iterable<Type> types = const <Type>[BuildFlavor];
  @override
  final String wireName = 'BuildFlavor';

  @override
  Object serialize(Serializers serializers, BuildFlavor object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  BuildFlavor deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BuildFlavor.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
