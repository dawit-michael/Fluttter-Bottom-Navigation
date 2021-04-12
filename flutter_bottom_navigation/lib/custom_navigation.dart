import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/painter.dart';

/// CustomNavigation Component
///
/// ```
/// double height
/// Color accentColor
/// List<BarItem> menuItems
/// Function onTap
/// ```
class CustomNavigation extends StatelessWidget {
  final double height;
  final Color accentColor;
  final Color backgroundColor;
  final List<BarItem> menuItems;
  final Function onTap;

  CustomNavigation({
    Key key,
    this.height = 100,
    @required this.menuItems,
    @required this.onTap,
    this.accentColor = Colors.black,
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
              painter: Painter(backgroundColor: backgroundColor),
              child: Container(
                height: 70,
              ),
            ),
          ),
          Positioned(
            bottom: 6,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        menuItems[0],
                        menuItems[1],
                      ],
                    ),
                  ),
                  Flexible(
                      child: SizedBox(
                    width: 100,
                  )),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        menuItems[2],
                        menuItems[3],
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
/// ```
/// final int index;  // index of the icon
/// final int currentIndex;  // index of current active icon
/// final IconData iconData;  // icon widget to display on the bar
/// final double size;
/// final Color selected;  // color for when icon is active
/// final Color unselected;  // Color for when icon is inactive
/// final Function(int) onTap;  // function to change index to selected icon
/// ````
class BarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData iconData;
  final double size;
  final Color selected;
  final Color unselected;
  final Function(int) onTap;

  const BarItem({
    Key key,
    @required this.index,
    @required this.onTap,
    this.iconData,
    this.size = 24,
    this.selected = Colors.black,
    this.unselected = Colors.grey,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(
          iconData,
          size: size,
          color: (currentIndex == index) ? selected : unselected,
        ),
      ),
    );
  }
}
