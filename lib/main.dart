import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottery/common/const/hive.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/view/main_screen.dart';
import 'package:lottery/model/lotto_model.dart';

void main() async{
  //하이브 초기화
  await Hive.initFlutter();

  Hive.registerAdapter<LottoModel>(LottoModelAdapter());

  await Hive.openBox<LottoModel>(hiveBoxName);

  runApp(
    const MaterialApp(
      home: DefaultLayout(
        child: MainScreen(),
      ),
    ),
  );
}
