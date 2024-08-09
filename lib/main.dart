import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'services/api_service.dart';
import 'utils/color_utility.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        FutureProvider<List<Map>>(
          create: (context) => ApiService().fetchPostsUsersAndComments(),
          initialData: const [],
        ),
      ],
      child: const MyApp(),
    ),
  );
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
