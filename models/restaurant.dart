class Restaurant {
  String googleId;
  String name;
  String address;

  Restaurant({this.googleId, this.name, this.address});

  Restaurant.fromJson(Map<String, dynamic> parsedJson)
      : googleId = parsedJson['googleId'],
        name = parsedJson['name'],
        address = parsedJson['address'];
}
