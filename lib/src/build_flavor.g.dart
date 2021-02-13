// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_flavor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuildFlavorAdapter extends TypeAdapter<BuildFlavor> {
  @override
  final int typeId = 2;

  @override
  BuildFlavor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BuildFlavor.PROD;
      case 1:
        return BuildFlavor.TEST;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, BuildFlavor obj) {
    switch (obj) {
      case BuildFlavor.PROD:
        writer.writeByte(0);
        break;
      case BuildFlavor.TEST:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuildFlavorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
