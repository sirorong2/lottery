import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottery/common/component/lotto_ball.dart';
import 'package:lottery/common/const/hive.dart';
import 'package:lottery/common/util/util.dart';
import 'package:lottery/model/lotto_model.dart';

class ThisWeekOverallWidget extends StatelessWidget {
  const ThisWeekOverallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<LottoModel>(hiveBoxName);
    LottoModel? thisWeekLotto = box.values.last;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  final now = DateTime.now();
                  final fetchTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    now.hour,
                  );

                  DateTime lastFetchDay =
                      DateTime.parse(box.values.last.drwNoDate);
                  //print('lastFetchDay: $lastFetchDay');

                  if (fetchTime.difference(lastFetchDay) <
                      const Duration(days: 7)) {
                    print('이미 최신 데이터가 있습니다.');
                    return;
                  }
                },
                child: const Icon(
                  Icons.update,
                )),
            Expanded(
              child: Column(
                children: [
                  Text('${thisWeekLotto.drwNo} 회 당첨번호'),
                  Text('${thisWeekLotto.drwNoDate} 추첨'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.qr_code,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottoBall(number: thisWeekLotto.drwtNo1),
            LottoBall(number: thisWeekLotto.drwtNo2),
            LottoBall(number: thisWeekLotto.drwtNo3),
            LottoBall(number: thisWeekLotto.drwtNo4),
            LottoBall(number: thisWeekLotto.drwtNo5),
            LottoBall(number: thisWeekLotto.drwtNo6),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                'assets/images/plus.png',
                width: MediaQuery.of(context).size.width / 20,
              ),
            ),
            LottoBall(number: thisWeekLotto.bnusNo),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('총 판매금액: ${Util.currencyFormat(thisWeekLotto.totSellamnt)}'),
            Text('1등 당첨금액: ${Util.currencyFormat(thisWeekLotto.firstWinamnt)}'),
            Text('1등 당첨자: ${thisWeekLotto.firstPrzwnerCo} 명'),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return  AlertDialog(
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text("닫기"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                  content: const SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Text('aaaa'),
                        Text('aaaa'),
                        Text('aaaa'),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text(
            '당첨정보 자세히 보기',
          ),
        ),
      ],
    );
  }
}
