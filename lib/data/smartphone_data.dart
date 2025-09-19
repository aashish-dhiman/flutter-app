import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tortoise/models.dart/card_details.dart';
import 'package:tortoise/models.dart/smartphone_details.dart';

class SmartphoneData {
  static const List<CardDetails> smartphones = [
    CardDetails(name: 'iPhone 16', image: 'assets/images/iphone16.svg'),
    CardDetails(
        name: 'iPhone 16 Plus', image: 'assets/images/iphone16plus.svg'),
    CardDetails(name: 'iPhone 16 Pro', image: 'assets/images/iphone16pro.svg'),
    CardDetails(
        name: 'iPhone 16 Pro Max', image: 'assets/images/iphone16max.svg'),
    CardDetails(name: 'Macbook Pro', image: 'assets/images/mac.svg'),
    CardDetails(name: 'iPad Pro', image: 'assets/images/ipad.svg'),
    CardDetails(name: 'iPhone 15', image: 'assets/images/iphone15.svg'),
    CardDetails(
        name: 'iPhone 15 Plus', image: 'assets/images/iphone15plus.svg'),
  ];

  static const SmartphoneDetails iPhone16Pro = SmartphoneDetails(
    name: 'iPhone 16 Pro',
    image: 'assets/images/iphone16pro.svg',
    specifications: [],
    shippingBannerConfig: ShippingBannerConfig(
        icon: 'assets/images/truck.svg',
        title: 'Shipping starts from 19th September onwards'),
    colors: [
      Color(0xFF464A4C),
      Color(0xFFD0DBCC),
      Color(0xFFEEE9CC),
      Color(0xFFEDD4D7),
      Color(0xFFD7DDE0),
    ],
    storage: [
      '128 GB',
      '256 GB',
      '512 GB',
      '1 TB',
    ],
    infoImage: 'assets/images/info16pro.png',
    devicePrice: '₹1,18,900',
    effectivePrice: '₹80,423',
    monthlyDeduction: '₹7,900',
  );

  static const SmartphoneDetails iPhone17Pro = SmartphoneDetails(
    name: 'iPhone 17 Pro',
    image: 'assets/images/i17pro.svg',
    specifications: [
      SpecificationItem(
        icon: Icons.phone_android,
        name: 'Screen size',
        detail: '6.3 inches',
      ),
      SpecificationItem(
        icon: Icons.camera_alt,
        name: 'Camera',
        detail: 'Rear facing: 48 MP',
      ),
      SpecificationItem(
        icon: Icons.storage,
        name: 'Storage and RAM',
        detail: '8 GB | 512 GB',
      ),
      SpecificationItem(
        icon: Icons.battery_full,
        name: 'Battery',
        detail: 'Up to 27 hours video playback',
      ),
      SpecificationItem(
        icon: Icons.signal_cellular_alt,
        name: 'Connectivity',
        detail: '5G',
      ),
    ],
    shippingBannerConfig: ShippingBannerConfig(
      icon: 'assets/images/truck.svg',
      title: 'Shipping will begin in 3-4 weeks',
    ),
    colors: [
      Color(0xFFED7A2F),
      Color(0xFFE7E7E7),
      Color(0xFF3E4B77),
    ],
    storage: [
      '128 GB',
      '256 GB',
      '512 GB',
      '1 TB',
    ],
    infoImage: 'assets/images/info17pro.png',
    devicePrice: '₹1,38,963',
    effectivePrice: '₹92,483',
    monthlyDeduction: '₹8,900',
  );
}
