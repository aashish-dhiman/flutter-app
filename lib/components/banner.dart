import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.bgColor,
    required this.textColor,
    required this.bannerHeight,
    required this.fontSize,
  });

  final String icon;
  final String title;
  final Color bgColor;
  final Color textColor;
  final double bannerHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bannerHeight,
      width: double.infinity,
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
