
import 'package:hive_flutter/hive_flutter.dart';

part 'lotto_model.g.dart';

@HiveType(typeId: 1)
class LottoModel {
  //총 상금액
  @HiveField(0)
  final int totSellamnt;

  //요청결과
  @HiveField(1)
  final String returnValue;

  //추첨일
  @HiveField(2)
  final String drwNoDate;

  //1등 당첨액
  @HiveField(3)
  final int firstWinamnt;

  //1등 당첨인원
  @HiveField(4)
  final int firstPrzwnerCo;

  //1등 총 상금액
  @HiveField(5)
  final int firstAccumamnt;

  //회차
  @HiveField(6)
  final int drwNo;

  //로또 번호
  @HiveField(7)
  final int drwtNo1;
  @HiveField(8)
  final int drwtNo2;
  @HiveField(10)
  final int drwtNo3;
  @HiveField(11)
  final int drwtNo4;
  @HiveField(12)
  final int drwtNo5;
  @HiveField(13)
  final int drwtNo6;
  @HiveField(14)
  final int bnusNo;

  LottoModel({
    required this.totSellamnt,
    required this.returnValue,
    required this.drwNoDate,
    required this.firstWinamnt,
    required this.firstPrzwnerCo,
    required this.firstAccumamnt,
    required this.drwNo,
    required this.drwtNo1,
    required this.drwtNo2,
    required this.drwtNo3,
    required this.drwtNo4,
    required this.drwtNo5,
    required this.drwtNo6,
    required this.bnusNo,
  });

  factory LottoModel.formJson(Map<String, dynamic> json){
    return LottoModel(
      totSellamnt: json['totSellamnt'],
      returnValue: json['returnValue'],
      drwNoDate: json['drwNoDate'],
      firstWinamnt: json['firstWinamnt'],
      firstPrzwnerCo: json['firstPrzwnerCo'],
      firstAccumamnt: json['firstAccumamnt'],
      drwNo: json['drwNo'],
      drwtNo1: json['drwtNo1'],
      drwtNo2: json['drwtNo2'],
      drwtNo3: json['drwtNo3'],
      drwtNo4: json['drwtNo4'],
      drwtNo5: json['drwtNo5'],
      drwtNo6: json['drwtNo6'],
      bnusNo: json['bnusNo'],);
  }

}
