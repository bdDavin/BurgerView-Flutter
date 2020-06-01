import 'package:cloud_firestore/cloud_firestore.dart';

class NewReview {
  final Timestamp timestamp;
  final String user;
  final String description;
  final int bunScore;
  final int toppingsScore;
  final int puckScore;
  final String imageURL;

  NewReview({
    this.user,
    this.description,
    this.bunScore,
    this.toppingsScore,
    this.puckScore,
    this.imageURL,
    this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'user': user,
        'description': description,
        'bunScore': bunScore,
        'toppingsScore': toppingsScore,
        'puckScore': puckScore,
        'imageURL': imageURL,
      };
}
