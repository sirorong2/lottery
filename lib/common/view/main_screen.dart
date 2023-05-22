import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottery/common/const/hive.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/repository/lotto_repository.dart';
import 'package:lottery/model/lotto_model.dart';
import '../portion/this_week_overall_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final now = DateTime.now();
      final fetchTime = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
      );

      var box = Hive.box<LottoModel>(hiveBoxName);

      DateTime lastFetchDay = DateTime.parse(box.values.last.drwNoDate);

      if (fetchTime.difference(lastFetchDay) < const Duration(days: 7)) {
        print('이미 최신 데이터가 있습니다.');
        return;
      }

      List<Future> futures = [];

      for (int i = 1060; i < 1069; i++) {
        futures.add(
          LottoRepository.fetchData(drwNo: i),
        );
      }
      //모든 요청 한번에 보내기
      //리턴되는 값은 List<String> 형태
      final result = await Future.wait(futures);

      //result의 List<String> 타입을 json타입으로 변환 후 List 생성
      var resultList =
          result.map((e) => LottoModel.formJson(jsonDecode(e))).toList();

      for (int i = 0; i < result.length; i++) {
        //키는 회차정보로 활용
        final key = resultList[i].drwNo;
        final value = resultList[i];
        box.put(key, value);
      }
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
    return const DefaultLayout(
        title: 'Lotto',
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ThisWeekOverallWidget(),
              _Bottom(),
            ],
          ),
        ));
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            '회차선택',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'QR 당첨 확인',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            '당첨번호 공유',
          ),
        ),
      ],
    );
  }
}
