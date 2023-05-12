import 'package:flutter/material.dart';

class LottoBall extends StatelessWidget {
  const LottoBall({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Image.asset(
        'assets/icons/number-$number.png',
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
