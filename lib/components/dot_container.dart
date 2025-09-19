import 'package:flutter/material.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({
    super.key,
    required this.count,
    this.activeIndex = 0,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0xFFCBCBCB),
    this.backgroundColor = const Color(0xFFAFAFAF),
    this.dotSize = 7.0,
    this.spacing = 4.0,
  });

  final int count;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double dotSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            count,
            (index) => Container(
              margin: EdgeInsets.only(
                right: index < count - 1 ? spacing : 0,
              ),
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: index == activeIndex ? activeColor : inactiveColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
