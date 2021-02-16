library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_kostlivec/src/state/config_state.dart';
import 'package:flutter_kostlivec/src/state/my_dummy_app_state.dart';
import 'package:flutter_kostlivec/src/build_flavor.dart';

part 'serializers.g.dart';

@SerializersFor([
  ConfigState,
  MyDummyAppState,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
