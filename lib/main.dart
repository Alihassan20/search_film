import 'package:flutter/material.dart';

import 'feature/home/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomeSearch(),
    );
  }
}

