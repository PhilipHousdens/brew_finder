import 'package:flutter/material.dart';

import 'component/header.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(title),
      ),
      body: Column(
        children: [
          Header(),
          NearbyLabel(size: size),
        ],
      ),
    );
  }
}

class NearbyLabel extends StatelessWidget {
  const NearbyLabel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Nearby',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}


