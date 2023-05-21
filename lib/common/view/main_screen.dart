import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/repository/lotto_repository.dart';
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
      List<Future> futures = [];

      for (int i = 1060; i < 1068; i++) {
        futures.add(
          LottoRepository.fetchData(drwNo: i),
        );
      }

      await Future.wait(futures);
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
