import 'dart:developer' as developer;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class GooglePlaceService {
  final _place = GoogleMapsPlaces(apiKey: 'AIzaSyCVo8mXBes720ZIPk8jZKJa8jygawaOQyE');

  Future<List<PlacesSearchResult>> fetchNearbyCoffeeShops(String query, LatLng location) async {
    final result = await _place.searchNearbyWithRadius(
      Location(lat: location.latitude, lng: location.longitude),
      5000,
      type: "restaurant",
      keyword: query,
    );
    if (result.status == "OK") {
      return result.results;
    } else {
      throw Exception(result.errorMessage);
    }
  }
}