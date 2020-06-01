import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:BurgerViewFlutter/widgets/burger_list_item_content.dart';
import 'package:flutter/material.dart';

class BurgerListItem extends StatelessWidget {
  final Burger burger;
  final Function(Burger) onTap;
  final double itemHeight;
  final int index;

  BurgerListItem({
    @required this.burger,
    @required this.index,
    this.onTap,
    this.itemHeight = 159,
  });

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onTap(burger);
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: itemHeight,
              width: _deviceWidth,
              child: Hero(
                tag: "burgerImage" + burger.documentId,
                child: burger.imageUrl != null
                    ? FadeInImage.assetNetwork(
                        placeholder: AppImages.DefaultBurger,
                        image: burger.imageUrl,
                        fit: BoxFit.cover,
                        fadeInDuration: Duration(milliseconds: 300),
                      )
                    : Image.asset(AppImages.DefaultBurger),
              ),
            ),
          ),
          Container(
            color: AppColors.PrimaryBackgroundColor.withOpacity(0.85),
            width: _deviceWidth,
            height: itemHeight,
          ),
          Hero(
            tag: "burgerContent" + burger.documentId,
            child: BurgerListItemContent(
              burger: burger,
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
