import 'package:hive/hive.dart';

part 'build_flavor.g.dart';

///
/// Environment - production or test?
///
/// See:
/// main_prod.dart
/// main_test.dart
///
@HiveType(typeId: 2)
enum BuildFlavor {
  @HiveField(0)
  PROD,
  @HiveField(1)
  TEST,
}
