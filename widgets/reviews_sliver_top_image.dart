import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:BurgerViewFlutter/styles/images.dart';
import 'package:flutter/material.dart';

class ReviewsSliverTopImage extends StatelessWidget {
  const ReviewsSliverTopImage({
    @required this.burger,
  });

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      elevation: 0.0,
      pinned: true,
      backgroundColor: AppColors.PrimaryBackgroundColor,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Hero(
          tag: "burgerImage" + burger.documentId,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1.0), BlendMode.dstATop),
                image: burger.imageUrl != null
                    ? NetworkImage(burger.imageUrl)
                    : AssetImage(
                        AppImages.DefaultBurger,
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
