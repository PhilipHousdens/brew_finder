import 'package:brew_finder/pages/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color redBrown = Color(0xff6A3C00);
    const Color creamWhite = Color(0xffE7D7B1);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: redBrown),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'assets/images/logo.png'),
    );
  }
}

