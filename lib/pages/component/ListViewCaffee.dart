import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/APIProvider.dart';

class CaffeList extends StatelessWidget {
  const CaffeList({Key? key});

  @override
  Widget build(BuildContext context) {
    final coffeeShopProvider = Provider.of<CoffeeShopProvider>(context);
    final coffeeShops = coffeeShopProvider.coffeeShops;
    final coffeeShopImages = coffeeShopProvider.coffeeShopImages;
    Size size = MediaQuery.of(context).size;

    if (coffeeShops == null || coffeeShops.isEmpty) {
      return Center(child: Text('No coffee shops found'));
    }

    return SizedBox(
      height: size.height , // Adjust the height as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: coffeeShops.length,
        itemBuilder: (context, index) {
          final coffeeShop = coffeeShops[index];
          final coffeeShopImage = coffeeShopImages[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: coffeeShopImage != null
                            ? DecorationImage(
                          image: coffeeShopImage.image,
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                    ),
                    title: Text(coffeeShop.name ?? 'Unknown'),
                    subtitle: Text(coffeeShop.vicinity ?? 'Unknown', overflow: TextOverflow.ellipsis,),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Text(coffeeShop.rating.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
