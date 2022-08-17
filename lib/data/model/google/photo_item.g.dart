// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoItemAdapter extends TypeAdapter<PhotoItem> {
  @override
  final int typeId = 3;

  @override
  PhotoItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoItem(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.baseUrl)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.filename)
      ..writeByte(4)
      ..write(obj.productUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
