import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/models/new_review.dart';
import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Future<List<Burger>> getBurgers(bool descending) {
    var burgers;
    burgers = _db
        .collection("burgers")
        .orderBy("ratingScore", descending: descending)
        .getDocuments()
        .then((value) => value.documents
            .map((doc) => Burger.fromJson(doc.data, doc.documentID))
            .toList());
    // .snapshots()
    // .map((snap) => snap.documents
    //     .map((doc) => Burger.fromJson(doc.data, doc.documentID))
    //     .toList());
    return burgers;
  }

  Stream<List<Review>> streamBurgerReviews(String burgerDocumentId) {
    return _db
        .collection("burgers")
        .document(burgerDocumentId)
        .collection("reviews")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snap) => snap.documents
            .map((doc) => Review.fromJson(doc.data, doc.documentID))
            .toList());
  }

  Stream<List<Burger>> streamRestaurantMenu(String restaurantGoogleId) {
    return _db
        .collection("burgers")
        .where("restaurantGoogleId", isEqualTo: restaurantGoogleId)
        .orderBy("burgerName")
        .snapshots()
        .map((snap) => snap.documents
            .map((doc) => Burger.fromJson(doc.data, doc.documentID))
            .toList());
  }

  Future<Burger> getBurger(String burgerId) async {
    return await _db
        .collection("burgers")
        .document(burgerId)
        .get()
        .then((doc) => Burger.fromJson(doc.data, doc.documentID));
  }

  void uploadNewBurger(String burgerName, Restaurant restaurant) async {
    Burger burger = Burger(
      burgerName: burgerName,
      restaurantGoogleId: restaurant.googleId,
      restaurantName: restaurant.name,
      restaurantAddress: restaurant.address,
    );
    await _db.collection("burgers").document().setData(burger.toJson());
  }

  Future<void> uploadBurgerReview(
      NewReview newReview, String burgerDocumentId) async {
    await _db
        .collection('burgers')
        .document(burgerDocumentId)
        .collection("reviews")
        .document()
        .setData(newReview.toJson());
  }
}
