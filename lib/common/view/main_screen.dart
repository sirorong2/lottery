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
            children: [
              const LottoBall(number: '1'),
              const LottoBall(number: '2'),
              const LottoBall(number: '3'),
              const LottoBall(number: '4'),
              const LottoBall(number: '5'),
              const LottoBall(number: '6'),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  'assets/images/plus.png',
                  width: MediaQuery.of(context).size.width / 20,
                ),
              ),
              const LottoBall(number: '7'),
            ],
          ),
        ],
      ),
    );
  }
}
