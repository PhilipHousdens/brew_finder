import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:brew_finder/model/google_place_service.dart'; // Import GooglePlaceService

class CoffeeShopProvider extends ChangeNotifier {
  final GooglePlaceService _googlePlaceService;

  CoffeeShopProvider(this._googlePlaceService);

  List<PlacesSearchResult>? _coffeeShops = [];
  List<PlacesSearchResult>? get coffeeShops => _coffeeShops;

  List<Image?> _coffeeShopImages = [];
  List<Image?> get coffeeShopImages => _coffeeShopImages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchCoffeeShops() async {
    print('Adding the Coffeeshops..');
    _isLoading = true;
    notifyListeners();
    try {
      _coffeeShops = await _googlePlaceService.fetchNearbyCoffeeShops('coffee shop', const LatLng(18.7883, 98.9853));
      // Fetch images for each coffee shop
      for (var shop in _coffeeShops!) {
        _coffeeShopImages.add(await _googlePlaceService.getPhoto(shop));
      }
    } catch (e) {
      // Handle error
      print('Error fetching coffee shops: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
