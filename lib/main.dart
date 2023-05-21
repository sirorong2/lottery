import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottery/common/const/hive_box.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/view/main_screen.dart';
import 'package:lottery/common/view/splash_screen.dart';
import 'package:lottery/model/lotto_model.dart';


void main() async{
  //hive 초기화
  await Hive.initFlutter();

  //Hive TypeAdapter 사용 등록
  Hive.registerAdapter<LottoModel>(LottoModelAdapter());

  await Hive.openBox(lottoBox);

  runApp(
    const MaterialApp(
      home: DefaultLayout(
        child: SplashScreen(),
      ),
    ),
  );
}
