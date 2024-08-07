import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetching Posts',
      theme: ThemeData(
        primaryColor: ColorUtility.main,
        scaffoldBackgroundColor: ColorUtility.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorUtility.main,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
