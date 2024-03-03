// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danh_muc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DanhMucAdapter extends TypeAdapter<DanhMuc> {
  @override
  final int typeId = 2;

  @override
  DanhMuc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DanhMuc(
      cophieus: (fields[1] as List).cast<Data2>(),
      tendanhmuc: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DanhMuc obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tendanhmuc)
      ..writeByte(1)
      ..write(obj.cophieus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DanhMucAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
