import 'dart:developer' as developer;
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;

class GooglePlaceService {
  final _place = GoogleMapsPlaces(apiKey: 'AIzaSyACCpdgdiALVKYpUADiKQdEVT7OL_hz_-g');

  Future<List<PlacesSearchResult>> fetchNearbyCoffeeShops(String query, LatLng location) async {
    final result = await _place.searchNearbyWithRadius(
      Location(lat: location.latitude, lng: location.longitude),
      2000,
      type: "restaurant",
      keyword: query,
    );
    if (result.status == "OK") {
      return result.results;
    } else {
      throw Exception(result.errorMessage);
    }
  }

  Future<Image?> getPhoto(PlacesSearchResult coffeeShop) async {
    try{
      // Get the photo reference from the coffee shop
      String photoRef = coffeeShop.photos![0].photoReference;

      String requestUrl = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&photoreference=$photoRef&key=$_place';

      final response = await http.get(Uri.parse(requestUrl));

      // If the request was successful, decode the image and return it
      if (response.statusCode == 200) {
        return Image.memory(
          response.bodyBytes,
          fit: BoxFit.cover,
        );
      } else {
        // If the request failed, log the error
        developer.log('Failed to load image for ${coffeeShop.name}: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any errors
      developer.log('Error loading image for ${coffeeShop.name}: $e');
      return null;
    }
  }
}