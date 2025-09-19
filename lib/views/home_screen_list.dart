import 'package:flutter/material.dart';
import 'package:tortoise/components/brand_card.dart';
import 'package:tortoise/components/mobile_card.dart';
import 'package:tortoise/data/brand_data.dart';
import 'package:tortoise/data/smartphone_data.dart';

class HomeScreenList extends StatefulWidget {
  const HomeScreenList({super.key});

  @override
  State<HomeScreenList> createState() => _HomeScreenListState();
}

class _HomeScreenListState extends State<HomeScreenList> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = BrandData.brands.indexOf(BrandData.brands[0]);
  }

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Select from popular brands',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: BrandData.brands
                .map((brand) => BrandCard(
                      brand: brand,
                      isSelected:
                          _selectedIndex == BrandData.brands.indexOf(brand),
                      handleTap: () =>
                          _handleTap(BrandData.brands.indexOf(brand)),
                    ))
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Available devices',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: SmartphoneData.smartphones.length,
            itemBuilder: (context, index) => MobileCard(
              mobile: SmartphoneData.smartphones[index],
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
