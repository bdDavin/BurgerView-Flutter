import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  String documentId;
  Timestamp timestamp;
  String user;
  String description;
  int bunScore;
  int toppingsScore;
  int puckScore;
  String imageURL;

  Review({
    this.documentId,
    this.timestamp,
    this.user,
    this.description,
    this.bunScore,
    this.toppingsScore,
    this.puckScore,
    this.imageURL,
  });

  Review.fromJson(Map<String, dynamic> parsedJson, String documentId)
      : documentId = documentId,
        timestamp = parsedJson['timestamp'],
        user = parsedJson['user'],
        description = parsedJson['description'],
        bunScore = parsedJson['bunScore'],
        toppingsScore = parsedJson['toppingsScore'],
        puckScore = parsedJson['puckScore'],
        imageURL = parsedJson['imageURL'];
}
