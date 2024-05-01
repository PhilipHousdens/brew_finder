import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:brew_finder/model/google_place_service.dart'; // Import GooglePlaceService

class NearbyCafe extends StatefulWidget {
  final GooglePlaceService googlePlaceService;

  const NearbyCafe({Key? key, required this.googlePlaceService}) : super(key: key);

  @override
  createState() => _NearbyCafeState();
}

class _NearbyCafeState extends State<NearbyCafe> {
  List<PlacesSearchResult> coffeeShops = [];
  List<Image?> coffeeShopsImages = []; // Changed to List<Image?>

  @override
  void initState() {
    super.initState();
    print('Init state called');
    fetchNearbyCoffeeShop();
  }

  void fetchNearbyCoffeeShop() async {
    print('Fetching nearby coffee shops...');
    coffeeShops = await widget.googlePlaceService.fetchNearbyCoffeeShops('coffee shop', const LatLng(18.7883, 98.9853));
    print('Fetched ${coffeeShops.length} coffee shops');

    // Retrieve images for each coffee shop
    for (var shop in coffeeShops) {
      coffeeShopsImages.add(await widget.googlePlaceService.getPhoto(shop));
    }

    setState(() {}); // Update the UI after fetching images
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < coffeeShops.length && i < 4; i++) // Limit to 5 items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: 150,
                    decoration: BoxDecoration(
                      image: coffeeShopsImages[i] != null // Check if image is available
                          ? DecorationImage(
                        image: coffeeShopsImages[i]!.image, // Use image if available
                        fit: BoxFit.cover,
                      )
                          : null, // Show placeholder or loading indicator
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.20),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          coffeeShops[i].name.toUpperCase(), // Access coffee shop name from the list
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 10,),
                            Flexible(
                              child: Text(
                                coffeeShops[i].vicinity ?? 'Unknown', // Access coffee shop vicinity from the list
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
