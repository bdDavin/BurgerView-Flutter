import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LocationService {
  final String _apiKey = "";
  Future<LocationData> getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return throw ("Error");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return throw ("Error");
      }
    }

    return await location.getLocation();
  }

  Future<List<Restaurant>> getNearbyBurgerRestaurants() async {
    var location = await getUserLocation();
    final String _url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=3000&type=restaurant&keyword=burger&key=$_apiKey";
    var reponse = await http.get(_url, headers: {"Accept": "application/json"});

    List data = json.decode(reponse.body)["results"];
    return data
        .map((place) => Restaurant(
            googleId: place["place_id"],
            name: place["name"],
            address: place["vicinity"]))
        .toList();
  }

  Future<List<Restaurant>> getSearchResults(String input) async {
    // var location = await getUserLocation();
    final String _url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$input+burger+restaurant&key=$_apiKey";
    //final String _url =
    //    "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&location=${location.latitude},${location.longitude}&radius=10000&types=establishment&key=$_apiKey&sessiontoken=$_uuid";
    var reponse = await http.get(_url, headers: {"Accept": "application/json"});
    List data = json.decode(reponse.body)["results"];
    return data
        .map((place) => Restaurant(
            googleId: place["place_id"],
            name: place["name"],
            address: place["formatted_address"]))
        .toList();
    // return data
    //     .map((place) => Restaurant(
    //         id: place["place_id"],
    //         name: place["structured_formatting"]["main_text"],
    //         address: place["structured_formatting"]["secondary_text"]))
    //     .toList();
  }
}
