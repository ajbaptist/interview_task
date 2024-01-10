import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff7ae6c6),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xff7ae6c6), primary: Color(0xff7ae6c6)),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
