import 'package:brew_finder/model/google_place_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'component/bottomNav.dart';
import 'component/header.dart';
import 'component/nearbyCaffe.dart';
import 'component/seemore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GooglePlaceService googlePlaceService = GooglePlaceService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo.png'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Header Section
              const Header(),
              const NearbySection(),
              Container(
                width: size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: size.width,
                          child: NearbyCafe(googlePlaceService: googlePlaceService),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              seemoreBtn(),
              Container(
                height: size.height * 0.1,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Top Rated',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              seemoreBtn(),
              SizedBox(height: 100),
            ],
          ),
          Positioned(
            bottom: 18,
            left: 12,
            right: 12,
            child: BottomNav(size: size),
          ),
        ],
      ),
    );
  }
}



class NearbySection extends StatelessWidget {
  const NearbySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1 ,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              'Nearby',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
