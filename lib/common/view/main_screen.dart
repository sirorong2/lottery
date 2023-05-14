import 'package:flutter/material.dart';
import 'package:lottery/common/component/lotto_ball.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/partion/this_week_partion_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'Lotto',
        child: Column(
          children: const [
            ThisWeekPartionWidget(),
          ],
        ));
  }
}
