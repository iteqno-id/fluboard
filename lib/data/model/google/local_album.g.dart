// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_album.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalAlbumAdapter extends TypeAdapter<LocalAlbum> {
  @override
  final int typeId = 2;

  @override
  LocalAlbum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalAlbum(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalAlbum obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.coverPhotoBaseUrl)
      ..writeByte(2)
      ..write(obj.mediaItemsCount)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalAlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
