import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/APIProvider.dart'; // Import GooglePlaceService

class topRated extends StatelessWidget {
  const topRated ({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeShopProvider = Provider.of<CoffeeShopProvider>(context);

    final coffeeShops = coffeeShopProvider.coffeeShops;
    final coffeeShopImages = coffeeShopProvider.coffeeShopImages; // Access images

    if (coffeeShops == null || coffeeShops.isEmpty) {
      return Text('No coffee shops found');
    } else {
      coffeeShops.sort((a,b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    }

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
                  Stack( // Use Stack to overlay the image and rating
                    children: [
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          image: coffeeShopImages[i] != null // Check if image is available
                              ? DecorationImage(
                            image: coffeeShopImages[i]!.image, // Use image if available
                            fit: BoxFit.cover,
                          )
                              : null, // Show placeholder or loading indicator
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                      if (coffeeShops[i].rating != null) // Display rating if available
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  coffeeShops[i].rating.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
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


