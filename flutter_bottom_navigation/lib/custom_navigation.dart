import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/item.dart';
import 'package:flutter_bottom_navigation/painter.dart';

/// CustomNavigation Component
class CustomNavigation extends StatelessWidget {
  final double height;
  final Color accentColor;
  final Color backgroundColor;
  final List<BarItem> menuItems;

  CustomNavigation({
    Key key,
    this.height = 100,
    @required this.menuItems,
    this.accentColor = Colors.tealAccent,
    this.backgroundColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: CustomPaint(
              /// a widget that paints the cropped custom background
              painter: Painter(),
              child: Container(
                height: 70,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 34,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.tealAccent, shape: BoxShape.circle),
                child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
              )),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        BarItem(index: 0, iconData: Icons.home_outlined),
                        SizedBox(
                          width: 50,
                        ),
                        BarItem(index: 1, iconData: Icons.grid_view),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        BarItem(
                            index: 2, iconData: Icons.favorite_border_rounded),
                        SizedBox(
                          width: 50,
                        ),
                        BarItem(
                            index: 3, iconData: Icons.person_outline_rounded),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// use this bar item for the bottom navigation icons
class BarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final ValueChanged<double> onTap;
  final IconData iconData;
  final double size;
  final Color selected;
  final Color unselected;

  const BarItem({
    Key key,
    this.index,
    this.onTap,
    this.iconData,
    this.size = 24,
    this.selected = Colors.black,
    this.unselected = Colors.grey,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // do something here
      },
      child: Container(
        child: Icon(
          iconData,
          size: size,
          color: (currentIndex == index) ? selected : unselected,
        ),
      ),
    );
  }
}
