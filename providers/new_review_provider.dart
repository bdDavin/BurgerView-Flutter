import 'dart:io';

import 'package:BurgerViewFlutter/models/new_review.dart';
import 'package:BurgerViewFlutter/services/database_service.dart';
import 'package:BurgerViewFlutter/services/image_service.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/services/storage_service.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/widgets/image_spinner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum NewReviewStep {
  bun,
  puck,
  toppings,
  description,
}

class NewReviewProvider with ChangeNotifier {
  double _bunScore;
  double _toppingsScore;
  double _puckScore;
  String _description;

  String burgerDocumentId;
  NewReviewStep _step;
  File _image;
  String _uploadedFileURL;

  NewReviewStep get step {
    return _step;
  }

  File get image {
    return _image;
  }

  NewReviewProvider({this.burgerDocumentId}) {
    _bunScore = 0.0;
    _toppingsScore = 0.0;
    _puckScore = 0.0;
    _description = "";
    _step = NewReviewStep.bun;
  }

  bool get isLastStep {
    return _step == NewReviewStep.description;
  }

  void nextStep(BuildContext context) {
    switch (_step) {
      case NewReviewStep.bun:
        _step = NewReviewStep.puck;
        break;
      case NewReviewStep.puck:
        _step = NewReviewStep.toppings;
        break;
      case NewReviewStep.toppings:
        _step = NewReviewStep.description;
        break;
      case NewReviewStep.description:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: ImageSpinner(
                assetImageUrl: AppImages.BurgerLogo,
              ),
            );
          },
        );
        uploadNewReview(context);
        break;
    }
    notifyListeners();
  }

  void previusStep() {
    switch (_step) {
      case NewReviewStep.bun:
        Routes.sailor.popUntil((route) {
          return route.isFirst;
        });
        break;
      case NewReviewStep.puck:
        _step = NewReviewStep.bun;
        break;
      case NewReviewStep.toppings:
        _step = NewReviewStep.puck;
        break;
      case NewReviewStep.description:
        _step = NewReviewStep.toppings;
        break;
    }
    notifyListeners();
  }

  double sliderValue() {
    switch (_step) {
      case NewReviewStep.bun:
        return _bunScore == 0.0 ? 5.5 : _bunScore;
      case NewReviewStep.puck:
        return _puckScore == 0.0 ? 5.5 : _puckScore;
      case NewReviewStep.toppings:
        return _toppingsScore == 0.0 ? 5.5 : _toppingsScore;
      default:
        return 5.0;
    }
  }

  void setImage(Function onCompleted) async {
    _image = await ImageService().getImage();
    onCompleted();
  }

  Future<void> uploadNewReview(BuildContext context) async {
    //TODO implement user
    if (_image != null) {
      _uploadedFileURL = await StorageService().uploadFile(_image);
    }

    NewReview newReview = NewReview(
      timestamp: Timestamp.now(),
      user: "Burger Ben",
      description: _description,
      bunScore: _bunScore.toInt(),
      toppingsScore: _toppingsScore.toInt(),
      puckScore: _puckScore.toInt(),
      imageURL: _uploadedFileURL,
    );

    await DatabaseService().uploadBurgerReview(newReview, burgerDocumentId);

    Future.delayed(const Duration(seconds: 8), () async {
      final burger = await DatabaseService().getBurger(burgerDocumentId);
      Routes.sailor.popUntil((route) {
        return route.isFirst;
      });
      Routes.sailor.navigate(Routes.BurgerReviewsSceenRoute, params: {
        "burger": burger,
      });
    });
  }

  bool stepAnswered() {
    switch (_step) {
      case NewReviewStep.bun:
        return _bunScore != 0.0;
      case NewReviewStep.puck:
        return _puckScore != 0.0;
      case NewReviewStep.toppings:
        return _toppingsScore != 0.0;
      case NewReviewStep.description:
        return true;
      default:
        return false;
    }
  }

  String stepBurgerImage() {
    switch (_step) {
      case NewReviewStep.bun:
        return AppImages.BurgerBun;
      case NewReviewStep.puck:
        return AppImages.BurgerPuck;
      case NewReviewStep.toppings:
        return AppImages.BurgerToppings;
      case NewReviewStep.description:
        return AppImages.BurgerAddImage;
      default:
        return "";
    }
  }

  String stepRateTextSmall() {
    switch (_step) {
      case NewReviewStep.bun:
      case NewReviewStep.puck:
      case NewReviewStep.toppings:
        return "Rate the";
      case NewReviewStep.description:
        return "Add image and describe the";
      default:
        return "";
    }
  }

  String stepRateTextBig() {
    switch (_step) {
      case NewReviewStep.bun:
        return "Bun";
      case NewReviewStep.puck:
        return "Puck";
      case NewReviewStep.toppings:
        return "Toppings";
      case NewReviewStep.description:
        return "Burger";
      default:
        return "";
    }
  }

  void setRating(var rating) {
    if (rating is double) {
      _setScore(rating);
    } else {
      _setDescription(rating);
    }
    notifyListeners();
  }

  void _setScore(double score) {
    switch (_step) {
      case NewReviewStep.bun:
        _bunScore = score;
        break;
      case NewReviewStep.puck:
        _puckScore = score;
        break;
      case NewReviewStep.toppings:
        _toppingsScore = score;
        break;
      default:
    }
  }

  void _setDescription(String text) {
    _description = text;
  }
}
