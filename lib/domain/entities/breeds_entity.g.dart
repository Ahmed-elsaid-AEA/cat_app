// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedsEntityAdapter extends TypeAdapter<BreedsEntity> {
  @override
  final int typeId = 0;

  @override
  BreedsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreedsEntity(
      breed: fields[0] as String,
      country: fields[1] as String,
      origin: fields[2] as String,
      coat: fields[3] as String,
      pattern: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BreedsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.breed)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.origin)
      ..writeByte(3)
      ..write(obj.coat)
      ..writeByte(4)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
