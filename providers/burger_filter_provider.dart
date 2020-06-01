import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/services/database_service.dart';
import 'package:flutter/material.dart';

enum RatingOrder {
  best,
  worst,
}

enum FilterBy {
  proximity,
  city,
  restaurant,
}

class BurgerFilterProvider with ChangeNotifier {
  final _db = DatabaseService();

  RatingOrder _ratingOrder;
  FilterBy _filterBy;

  double _kmValue;
  String _searchInput;

  List<Burger> _burgers;

  BurgerFilterProvider() {
    _ratingOrder = RatingOrder.best;
    _filterBy = FilterBy.proximity;
    _kmValue = 3;
    _searchInput = "";
    _burgers = null;
    setBurgers();
  }

  List<Burger> get burgers {
    return _burgers;
  }

  RatingOrder get ratingOrder {
    return _ratingOrder;
  }

  FilterBy get filterBy {
    return _filterBy;
  }

  double get kmValue {
    return _kmValue;
  }

  String get searchInput {
    return _searchInput;
  }

  setKmValue(value) {
    _kmValue = value;
    notifyListeners();
  }

  setSearchInput(input) {
    _searchInput = input;
    notifyListeners();
  }

  setRatingOrder(value) {
    switch (value) {
      case 0:
        _ratingOrder = RatingOrder.best;
        break;
      case 1:
        _ratingOrder = RatingOrder.worst;
        break;
      default:
    }
    setBurgers();
  }

  setFilterBy(value) {
    switch (value) {
      case 0:
        _filterBy = FilterBy.proximity;
        break;
      case 1:
        _filterBy = FilterBy.city;
        break;
      case 2:
        _filterBy = FilterBy.restaurant;
        break;
      default:
    }
    // setBurgers();
  }

  Future<void> setBurgers() async {
    _burgers = null;
    notifyListeners();
    bool descending = _ratingOrder == RatingOrder.best;
    _burgers = await _db.getBurgers(descending);
    Future.delayed(Duration(milliseconds: 500), () {
      notifyListeners();
    });
  }
}
