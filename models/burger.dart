class Burger {
  final String documentId;
  final String burgerName;
  final int numberOfReviews;
  final int ratingScore;
  final String averageBunScore;
  final String averageToppingsScore;
  final String averagePuckScore;
  final String imageUrl;
  final String restaurantGoogleId;
  final String restaurantName;
  final String restaurantAddress;

  Burger({
    this.documentId,
    this.burgerName,
    this.numberOfReviews,
    this.ratingScore,
    this.averageBunScore,
    this.averageToppingsScore,
    this.averagePuckScore,
    this.imageUrl,
    this.restaurantGoogleId,
    this.restaurantName,
    this.restaurantAddress,
  });

  Burger.fromJson(Map<String, dynamic> parsedJson, String documentId)
      : documentId = documentId,
        burgerName = parsedJson['burgerName'],
        numberOfReviews = parsedJson['numberOfReviews'],
        ratingScore = parsedJson['ratingScore'],
        averageBunScore = parsedJson['averageBunScore'],
        averageToppingsScore = parsedJson['averageToppingsScore'],
        averagePuckScore = parsedJson['averagePuckScore'],
        imageUrl = parsedJson['imageUrl'],
        restaurantGoogleId = parsedJson['restaurantGoogleId'],
        restaurantName = parsedJson['restaurantName'],
        restaurantAddress = parsedJson['restaurantAddress'];

  Map<String, dynamic> toJson() => {
        'burgerName': burgerName,
        'restaurantGoogleId': restaurantGoogleId,
        'restaurantName': restaurantName,
        'restaurantAddress': restaurantAddress,
      };
}
