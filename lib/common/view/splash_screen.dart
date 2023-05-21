import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottery/common/const/hive_box.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/repository/lotto_repository.dart';
import 'package:lottery/common/view/main_screen.dart';

import 'package:http/http.dart' as http;
import 'package:lottery/model/lotto_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //데이터 불러오기
    fetchData();
    //data = fetch('1067');

    //임시로 듀레이션 처리
    Timer(
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final now = DateTime.now();
      final fetchDay = DateTime(
        now.year,
        now.month,
        now.day,
      );

      final box = Hive.box(lottoBox);
      final recent = box.values.last as LottoModel;

      final lastFetchDay = DateTime.parse(recent.drwNoDate);

      if (lastFetchDay.difference(fetchDay).inDays < 7) {
        print('이미 최신데이터가 있습니다.');
        return;
      }

      List<Future> futures = [];

      for (int i = 0; i < 1067; i++) {
        print(i);
        futures.add(
          LottoRepository.fetchData(
            drwNo: i,
          ),
        );
      }

      final results = await Future.wait(futures);


    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '인터넷 연결이 원활하지 않습니다.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LOTTO',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/lotto.png',
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
