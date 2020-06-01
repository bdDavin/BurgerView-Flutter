import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/models/restaurant.dart';
import 'package:BurgerViewFlutter/screens/add_review_burger_screen.dart';
import 'package:BurgerViewFlutter/screens/add_review_rating_screen.dart';
import 'package:BurgerViewFlutter/screens/add_review_restaurant_screen.dart';
import 'package:BurgerViewFlutter/screens/burger_reviews_screen.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor();

  static const HomeSceenRoute = "/homeScreen";
  static const BurgerReviewsSceenRoute = "/burgerReviewsScreen";
  static const AddReviewRestaurantSceenRoute = "/addReviewRScreen";
  static const AddReviewBurgerSceenRoute = "/addReviewBScreen";
  static const AddReviewRateSceenRoute = "/addReviewRateScreen";
  static const AddNewBurgerSceenRoute = "/addNewBurgerScreen";

  static void createRoutes() {
    sailor.addRoutes(
      [
        SailorRoute(
          name: BurgerReviewsSceenRoute,
          defaultTransitions: [SailorTransition.fade_in],
          params: [
            SailorParam<Burger>(
              name: 'burger',
              isRequired: true,
            ),
          ],
          builder: (context, args, params) {
            return BurgerReviewsScreen();
          },
        ),
        SailorRoute(
          name: AddReviewRestaurantSceenRoute,
          defaultTransitions: [
            SailorTransition.slide_from_bottom,
          ],
          builder: (context, args, params) {
            return AddReviewRestaurantScreen();
          },
        ),
        SailorRoute(
          name: AddReviewBurgerSceenRoute,
          defaultTransitions: [
            SailorTransition.slide_from_right,
          ],
          params: [
            SailorParam<Restaurant>(
              name: 'restaurant',
              isRequired: true,
            ),
          ],
          builder: (context, args, params) {
            return AddReviewBurgerScreen();
          },
        ),
        SailorRoute(
          name: AddReviewRateSceenRoute,
          defaultTransitions: [
            SailorTransition.slide_from_right,
          ],
          params: [
            SailorParam<Burger>(
              name: 'burger',
              isRequired: true,
            ),
          ],
          builder: (context, args, params) {
            return AddReviewRatingScreen();
          },
        ),
      ],
    );
  }
}
