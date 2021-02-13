// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigStateAdapter extends TypeAdapter<ConfigState> {
  @override
  final int typeId = 3;

  @override
  ConfigState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigState()
      .._mode = fields[0] as BuildFlavor
      .._language = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, ConfigState obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._mode)
      ..writeByte(1)
      ..write(obj._language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
