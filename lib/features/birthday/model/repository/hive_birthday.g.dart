// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_birthday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBirthdayAdapter extends TypeAdapter<HiveBirthday> {
  @override
  final int typeId = 1;

  @override
  HiveBirthday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBirthday(
      name: fields[0] as String,
      birthday: fields[1] as DateTime,
      color: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBirthday obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthday)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBirthdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
