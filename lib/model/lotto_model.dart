import 'package:hive_flutter/hive_flutter.dart';

part 'lotto_model.g.dart';

@HiveType(typeId: 1)
class LottoModel {
  //회차
  @HiveField(0)
  final int drwNo;

  //추첨일
  @HiveField(1)
  final String drwNoDate;

  //요청결과
  @HiveField(2)
  final String returnValue;

  //총 상금액
  @HiveField(3)
  final int totSellamnt;

  //1등 당첨액
  @HiveField(4)
  final int firstWinamnt;

  //1등 당첨인원
  @HiveField(5)
  final int firstPrzwnerCo;

  //1등 총 상금액
  @HiveField(6)
  final int firstAccumamnt;

  //로또 번호
  @HiveField(7)
  final int drwtNo1;
  @HiveField(8)
  final int drwtNo2;
  @HiveField(9)
  final int drwtNo3;
  @HiveField(10)
  final int drwtNo4;
  @HiveField(11)
  final int drwtNo5;
  @HiveField(12)
  final int drwtNo6;
  @HiveField(13)
  final int bnusNo;

  LottoModel(
      {required this.drwNo,
      required this.drwNoDate,
      required this.returnValue,
      required this.totSellamnt,
      required this.firstWinamnt,
      required this.firstPrzwnerCo,
      required this.firstAccumamnt,
      required this.drwtNo1,
      required this.drwtNo2,
      required this.drwtNo3,
      required this.drwtNo4,
      required this.drwtNo5,
      required this.drwtNo6,
      required this.bnusNo});

  factory LottoModel.formJson(Map<String, dynamic> json) {
    return LottoModel(
      drwNo: json["drwNo"],
      drwNoDate: json["drwNoDate"],
      returnValue: json["returnValue"],
      totSellamnt: json["totSellamnt"],
      firstWinamnt: json["firstWinamnt"],
      firstPrzwnerCo: json["firstPrzwnerCo"],
      firstAccumamnt: json["firstAccumamnt"],
      drwtNo1: json["drwtNo1"],
      drwtNo2: json["drwtNo2"],
      drwtNo3: json["drwtNo3"],
      drwtNo4: json["drwtNo4"],
      drwtNo5: json["drwtNo5"],
      drwtNo6: json["drwtNo6"],
      bnusNo: json["bnusNo"],
    );
  }
}
