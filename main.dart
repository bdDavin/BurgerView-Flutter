import 'package:BurgerViewFlutter/screens/burgers_screen.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:flutter/material.dart';

void main() {
  Routes.createRoutes();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BurgerView',
      home: HomeScreen(),
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
    );
  }
}
