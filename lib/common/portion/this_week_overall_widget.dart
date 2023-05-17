import 'package:flutter/material.dart';
import 'package:lottery/common/component/lotto_ball.dart';

class ThisWeekOverallWidget extends StatelessWidget {
  const ThisWeekOverallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _RenderTop(),
        const SizedBox(height: 20,),
        const _RenderMiddle(),
        const SizedBox(height: 20,),
        const _RenderBottom(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: const Text(
            '당첨정보 자세히 보기',
          ),
        ),
      ],
    );
  }
}

class _RenderTop extends StatelessWidget {
  const _RenderTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _RenderMiddle extends StatelessWidget {
  const _RenderMiddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _RenderBottom extends StatelessWidget {
  const _RenderBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('총 판매금액   : 11111111111'),
        Text('1등 당첨금액  : 1111111111'),
        Text('1등 당첨자    : 15'),
      ],
    );
  }
}
