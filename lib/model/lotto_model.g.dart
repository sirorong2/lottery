// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lotto_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LottoModelAdapter extends TypeAdapter<LottoModel> {
  @override
  final int typeId = 1;

  @override
  LottoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LottoModel(
      drwNo: fields[0] as int,
      drwNoDate: fields[1] as String,
      returnValue: fields[2] as String,
      totSellamnt: fields[3] as int,
      firstWinamnt: fields[4] as int,
      firstPrzwnerCo: fields[5] as int,
      firstAccumamnt: fields[6] as int,
      drwtNo1: fields[7] as int,
      drwtNo2: fields[8] as int,
      drwtNo3: fields[9] as int,
      drwtNo4: fields[10] as int,
      drwtNo5: fields[11] as int,
      drwtNo6: fields[12] as int,
      bnusNo: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LottoModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.drwNo)
      ..writeByte(1)
      ..write(obj.drwNoDate)
      ..writeByte(2)
      ..write(obj.returnValue)
      ..writeByte(3)
      ..write(obj.totSellamnt)
      ..writeByte(4)
      ..write(obj.firstWinamnt)
      ..writeByte(5)
      ..write(obj.firstPrzwnerCo)
      ..writeByte(6)
      ..write(obj.firstAccumamnt)
      ..writeByte(7)
      ..write(obj.drwtNo1)
      ..writeByte(8)
      ..write(obj.drwtNo2)
      ..writeByte(9)
      ..write(obj.drwtNo3)
      ..writeByte(10)
      ..write(obj.drwtNo4)
      ..writeByte(11)
      ..write(obj.drwtNo5)
      ..writeByte(12)
      ..write(obj.drwtNo6)
      ..writeByte(13)
      ..write(obj.bnusNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LottoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
