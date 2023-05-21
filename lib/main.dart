import 'package:flutter/material.dart';
import 'package:lottery/common/layout/default_layout.dart';
import 'package:lottery/common/view/main_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DefaultLayout(
        child: MainScreen(),
      ),
    ),
  );
}
