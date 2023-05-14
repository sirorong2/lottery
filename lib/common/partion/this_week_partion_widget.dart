import 'package:flutter/material.dart';
import 'package:lottery/common/component/lotto_ball.dart';

class ThisWeekPartionWidget extends StatelessWidget {
  const ThisWeekPartionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.update),
            Column(
              children: const [
                Text('1066회 당첨번호'),
                Text('2023년 05월 06일 추첨'),
              ],
            ),
            const Icon(Icons.qr_code),
          ],
        ),
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
        Row(
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
        )
      ],
    );
  }
}
