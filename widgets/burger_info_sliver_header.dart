import 'package:BurgerViewFlutter/models/burger.dart';
import 'package:BurgerViewFlutter/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'burger_list_item_content.dart';

class BurgerInfoSliverHeader extends StatelessWidget {
  BurgerInfoSliverHeader({
    @required this.burger,
  });

  final Burger burger;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 163.0,
        maxHeight: 163.0,
        child: Hero(
          tag: "burgerContent" + burger.documentId,
          child: Container(
            color: AppColors.PrimaryBackgroundColor,
            child: BurgerListItemContent(
              burger: burger,
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
