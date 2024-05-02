import 'package:brew_finder/pages/component/nearbyCaffe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controller/APIProvider.dart';
import '../model/google_place_service.dart';
import 'component/ListViewCaffee.dart';
import 'component/bottomNav.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  void initState() {
    super.initState();
    // Fetch coffee shops when the widget is initialized
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<CoffeeShopProvider>(context, listen: false).fetchCoffeeShops();
    });
  }


  @override
  Widget build(BuildContext context) {
    final coffeeShopProvider = Provider.of<CoffeeShopProvider>(context);
    Size size = MediaQuery.of(context).size;
    GooglePlaceService googlePlaceService = GooglePlaceService();

    if (coffeeShopProvider.isLoading) {
      return Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
      ); // Show loading indicator while fetching data
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset('assets/images/logo.png'),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 92,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff6A3C00),
                              borderRadius: BorderRadius.all(Radius.circular(24))
                            ),
                            child: Center(
                              child: Text(
                                'Nearby',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.tune,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: [
                          Container(
                            width: size.width,
                            child: CaffeList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 18,
              left: 12,
              right: 12,
              child: BottomNav(size: size),
            ),
          ]
        )
    );
  }
}
