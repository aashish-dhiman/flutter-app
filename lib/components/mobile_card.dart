import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/models/card_details.dart';

class MobileCard extends StatelessWidget {
  const MobileCard({
    super.key,
    required this.mobile,
    required this.onTap,
  });
  final CardDetails mobile;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              mobile.image,
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 8),
            Text(
              mobile.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
