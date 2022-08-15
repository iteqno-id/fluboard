// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_access_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalAccessTokenAdapter extends TypeAdapter<LocalAccessToken> {
  @override
  final int typeId = 1;

  @override
  LocalAccessToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalAccessToken(
      type: fields[0] as String,
      data: fields[1] as String,
      expiry: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LocalAccessToken obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.expiry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalAccessTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
