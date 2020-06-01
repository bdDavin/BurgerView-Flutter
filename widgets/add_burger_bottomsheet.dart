import 'package:BurgerViewFlutter/services/routes.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/text.dart';
import 'package:BurgerViewFlutter/widgets/burger_input_field.dart';
import 'package:BurgerViewFlutter/widgets/burger_long_add_button.dart';
import 'package:BurgerViewFlutter/widgets/cancel_button.dart';
import 'package:flutter/material.dart';

class AddBurgerBottomSheet extends StatefulWidget {
  @override
  _AddBurgerBottomSheetState createState() => _AddBurgerBottomSheetState();
}

class _AddBurgerBottomSheetState extends State<AddBurgerBottomSheet> {
  bool addEnabled = false;
  String burgerName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.PrimaryBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Add new burger to the menu",
              style: TextStyles.OpenSansBoldSize12TextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            BurgerInputField(
              onChange: (value) {
                setState(() {
                  addEnabled = value != "";
                  burgerName = value;
                });
              },
              hintText: "Burger name",
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Please write the name exactly as it says in the restaurant menu",
              style: TextStyles.OpenSansBoldSize14TextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CancelButton(),
                BurgerLongAddButton(
                  enabled: addEnabled,
                  text: "Add",
                  onTap: () {
                    Routes.sailor.pop(burgerName);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
