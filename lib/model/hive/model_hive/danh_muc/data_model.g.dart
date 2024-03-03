// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Data2Adapter extends TypeAdapter<Data2> {
  @override
  final int typeId = 5;

  @override
  Data2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data2(
      fields[5] as double,
      fields[6] as double,
      fields[4] as double,
      fields[3] as String,
      fields[2] as String,
      fields[0] as String,
      fields[8] as int,
      fields[1] as String,
      fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Data2 obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.fullname)
      ..writeByte(3)
      ..write(obj.exchange)
      ..writeByte(4)
      ..write(obj.closePrice)
      ..writeByte(5)
      ..write(obj.change)
      ..writeByte(6)
      ..write(obj.changePercent)
      ..writeByte(7)
      ..write(obj.totalTrading)
      ..writeByte(8)
      ..write(obj.isSave);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Data2Adapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
