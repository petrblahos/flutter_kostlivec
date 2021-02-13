// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_dummy_app_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyDummyAppStateAdapter extends TypeAdapter<MyDummyAppState> {
  @override
  final int typeId = 1;

  @override
  MyDummyAppState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyDummyAppState()
      .._counter = fields[0] as int
      .._items = (fields[1] as List)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, MyDummyAppState obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._counter)
      ..writeByte(1)
      ..write(obj._items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyDummyAppStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
