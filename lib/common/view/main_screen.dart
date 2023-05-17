import 'package:flutter/material.dart';
import 'package:lottery/common/layout/default_layout.dart';
import '../portion/this_week_overall_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Lotto',
      child: Column(
        children: const [
          ThisWeekOverallWidget(),
          const SizedBox(height: 20,),
          _Bottom(),
        ],
      ),
    );
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
