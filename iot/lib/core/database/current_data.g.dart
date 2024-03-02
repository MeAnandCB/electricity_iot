// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentDataAdapter extends TypeAdapter<CurrentData> {
  @override
  final int typeId = 1;

  @override
  CurrentData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentData(
      current: fields[0] as double,
      bill_amount: fields[1] as double,
      date: fields[2] as String,
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.bill_amount)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
