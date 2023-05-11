import 'package:flutter/material.dart';
import 'package:lottery/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Center(),
    );
  }
}
