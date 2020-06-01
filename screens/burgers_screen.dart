import 'dart:async';

import 'package:BurgerViewFlutter/providers/burger_filter_provider.dart';
import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/widgets/burger_add_fab.dart';
import 'package:BurgerViewFlutter/widgets/burger_filter_tab.dart';
import 'package:BurgerViewFlutter/widgets/burger_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _panelController = PanelController();

  StreamSubscription<bool> keyboardvisi;
  @override
  void initState() {
    super.initState();
    keyboardvisi = KeyboardVisibility.onChange.listen((bool visible) {
      if (!visible) {
        _panelController.close();
      }
    });
  }

  @override
  void dispose() {
    keyboardvisi.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => BurgerFilterProvider(),
        ),
      ],
      child: Scaffold(
        body: SlidingUpPanel(
          minHeight: 60.0,
          maxHeight: 335.0,
          color: AppColors.SecondaryBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          border: Border.all(width: 2.0),
          onPanelClosed: () {
            FocusScope.of(context).unfocus();
          },
          controller: _panelController,
          panel: BurgerFilterTab(),
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                BurgerList(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 30.0, bottom: 10.0),
                      alignment: Alignment.bottomRight,
                      child: CircularButton(
                        onPressed: () {
                          Routes.sailor
                              .navigate(Routes.AddReviewRestaurantSceenRoute);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    )
                    // BurgerFilterTab(),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.PrimaryBackgroundColor,
      ),
    );
  }
}
