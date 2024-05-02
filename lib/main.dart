import 'package:brew_finder/controller/APIProvider.dart';
import 'package:brew_finder/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/google_place_service.dart';

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
    GooglePlaceService googlePlaceService = GooglePlaceService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CoffeeShopProvider(googlePlaceService),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BrewFinder',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: redBrown, secondary: creamWhite),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

