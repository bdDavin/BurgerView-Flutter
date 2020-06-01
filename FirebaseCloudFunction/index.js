/* eslint-disable promise/always-return */
// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require("firebase-functions");

// The Firebase Admin SDK to access Cloud Firestore.
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();

exports.updateBurgerScores = functions.firestore
  .document("burgers/{burgerId}/reviews/{reviewId}")
  .onWrite((change, context) => {
    const burgerId = context.params.burgerId;

    let bunTotal = 0;
    let puckTotal = 0;
    let toppingsTotal = 0;

    return db
      .collection("burgers")
      .doc(burgerId)
      .collection("reviews")
      .get()
      .then((snapshot) => {
        snapshot.forEach((doc) => {
          console.log("doc: " + doc.data()["bunScore"]);
          bunTotal = bunTotal + doc.data()["bunScore"];
          puckTotal = puckTotal + doc.data()["puckScore"];
          toppingsTotal = toppingsTotal + doc.data()["toppingsScore"];
        });
        const numberOfReviews = snapshot.docs.length;
        db.doc("burgers/" + burgerId).update({
          averageBunScore: (bunTotal / numberOfReviews).toFixed(1),
          averagePuckScore: (puckTotal / numberOfReviews).toFixed(1),
          averageToppingsScore: (toppingsTotal / numberOfReviews).toFixed(1),
          ratingScore: bunTotal + puckTotal + toppingsTotal,
          numberOfReviews: numberOfReviews,
          imageUrl: snapshot.docs[snapshot.docs.length - 1].data()["imageURL"],
        });
      })
      .catch((err) => {
        console.log("Error getting documents", err);
      });
  });
