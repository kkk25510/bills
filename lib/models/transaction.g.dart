// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      name: fields[0] as String,
      room: fields[1] as String,
      Ecurrent: fields[2] as int,
      Eprevious: fields[3] as int,
      Eunit: fields[4] as int,
      Wcurrent: fields[5] as int,
      Wprevious: fields[6] as int,
      Wunit: fields[7] as int,
      date: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.room)
      ..writeByte(2)
      ..write(obj.Ecurrent)
      ..writeByte(3)
      ..write(obj.Eprevious)
      ..writeByte(4)
      ..write(obj.Eunit)
      ..writeByte(5)
      ..write(obj.Wcurrent)
      ..writeByte(6)
      ..write(obj.Wprevious)
      ..writeByte(7)
      ..write(obj.Wunit)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
