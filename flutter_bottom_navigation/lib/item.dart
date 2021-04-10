import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    this.size,
    this.selected,
    this.unselected,
    this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap(index.toDouble());
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

class SpecialBarItem extends StatefulWidget {
  final ValueChanged<double> onTap;
  final Color color;

  const SpecialBarItem({
    Key key,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  _SpecialBarItemState createState() => _SpecialBarItemState();
}

class _SpecialBarItemState extends State<SpecialBarItem>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // padding: const EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.add,
          size: 34,
        ),
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ActionBarItem extends StatelessWidget {
  final int index;
  final int mainIndex;
  final ValueChanged<double> onTap;
  final IconData iconData;
  final double size;

  const ActionBarItem({
    Key key,
    this.index,
    this.onTap,
    this.mainIndex,
    this.iconData,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          String str = mainIndex.toString() + "." + index.toString();
          onTap(double.parse(str));
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            size: size,
          ),
        ),
      ),
    );
  }
}
