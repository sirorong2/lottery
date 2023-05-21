import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottery/common/layout/default_layout.dart';
import '../portion/this_week_overall_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    try{

      // for(int i = 1060; i< 1067; i++) {
      //   fetchData(drwNo: i);
      // }

      List<Future> futures = [];

      for (int i = 1060; i < 1068; i++) {
        futures.add(
          fetchData(drwNo: i),
        );
      }

      await Future.wait(futures);
    } on DioError catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '인터넷 연결이 원활하지 않습니다.',
          ),
        ),
      );
    }

  }

  Future<void> fetchData({required int drwNo}) async {
    var dio = Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    print('요청 $drwNo');
    final response = await dio
        .get('https://www.dhlottery.co.kr/common.do', queryParameters: {
      'method': 'getLottoNumber',
      'drwNo': drwNo,
    });
    print(response.statusCode);
    print(response.data);
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
