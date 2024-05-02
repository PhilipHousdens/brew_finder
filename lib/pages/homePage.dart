import 'package:brew_finder/model/google_place_service.dart';
import 'package:brew_finder/pages/component/top-rated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../controller/APIProvider.dart';
import 'component/bottomNav.dart';
import 'component/header.dart';
import 'component/nearbyCaffe.dart';
import 'component/seemore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                // Header Section
                const Header(),
                const NearbySection(),
                Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: size.width,
                            child: NearbyCafe(),
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
                Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: size.width,
                            child: topRated(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                seemoreBtn(),
                SizedBox(height: 100),
              ],
            ),
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
