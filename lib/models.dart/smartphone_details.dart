import 'package:flutter/material.dart';

class SpecificationItem {
  final IconData icon;
  final String name;
  final String detail;

  const SpecificationItem({
    required this.icon,
    required this.name,
    required this.detail,
  });
}

class ShippingBannerConfig {
  final String icon;
  final String title;

  const ShippingBannerConfig({
    required this.icon,
    required this.title,
  });
}

class SmartphoneDetails {
  final String name;
  final String image;
  final List<SpecificationItem> specifications;
  final ShippingBannerConfig shippingBannerConfig;
  final List<Color> colors;
  final List<String> storage;
  final String infoImage;
  final String devicePrice;
  final String effectivePrice;
  final String monthlyDeduction;

  const SmartphoneDetails({
    required this.name,
    required this.image,
    required this.specifications,
    required this.shippingBannerConfig,
    required this.colors,
    required this.storage,
    required this.infoImage,
    required this.devicePrice,
    required this.effectivePrice,
    required this.monthlyDeduction,
  });
}
