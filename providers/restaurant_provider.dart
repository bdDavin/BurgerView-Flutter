import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/services/location_service.dart';
import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _nearbyRestaurants;
  List<Restaurant> _searchedRestaurants;

  bool _showSearchedResults;

  RestaurantProvider() {
    _nearbyRestaurants = [];
    _searchedRestaurants = [];
    _showSearchedResults = false;
    setNearbyRestaurants();
  }

  List<Restaurant> get nearbyRestaurants => _nearbyRestaurants;
  List<Restaurant> get searchedRestaurants => _searchedRestaurants;
  bool get showSearchedResults => _showSearchedResults;

  void setShowSearchedResults(bool show) {
    _showSearchedResults = show;
    notifyListeners();
  }

  void setNearbyRestaurants() async {
    _nearbyRestaurants = await LocationService().getNearbyBurgerRestaurants();
    notifyListeners();
  }

  void setSearchedRestaurants(String input) async {
    _searchedRestaurants = await LocationService().getSearchResults(input);
    notifyListeners();
  }
}
