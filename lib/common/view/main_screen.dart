import 'package:flutter/material.dart';
import 'package:lottery/common/component/lotto_ball.dart';
import 'package:lottery/common/layout/default_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Lotto',
      child: Column(
        children: [
          Text('1066회 당첨번호'),
          Text('2023년 05월 06일 추첨'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LottoBall(number: '1'),
              LottoBall(number: '2'),
              LottoBall(number: '3'),
              LottoBall(number: '4'),
              LottoBall(number: '5'),
              LottoBall(number: '6'),
            ],
          ),
        ],
      ),
    );
  }
}
