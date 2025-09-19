import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise/components/banner.dart';
import 'package:tortoise/components/dot_container.dart';
import 'package:tortoise/components/color_picker_container.dart';
import 'package:tortoise/components/effective_price_sheet.dart';
import 'package:tortoise/components/storage_card.dart';
import 'package:tortoise/components/specs_card.dart';
import 'package:tortoise/models/smartphone_details.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.smartphoneDetails});

  final SmartphoneDetails smartphoneDetails;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int currentImageIndex = 0;
  int selectedStorageIndex = 0;
  bool isExpanded = true;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final smartphoneDetails = widget.smartphoneDetails;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          smartphoneDetails.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            PhosphorIcons.caretCircleLeft(),
            size: 32.0,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBanner(
              icon: smartphoneDetails.shippingBannerConfig.icon,
              title: smartphoneDetails.shippingBannerConfig.title,
              bgColor: const Color(0xFFFAF4EA),
              textColor: const Color(0xFF996A2E),
              bannerHeight: 52,
              fontSize: 14,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  smartphoneDetails.image,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const DotContainer(count: 4),
            const SizedBox(height: 20),
            const CustomBanner(
              icon: 'assets/images/verified.svg',
              title: 'Protected with Tortoise Corporate Care',
              bgColor: Color(0xFF114037),
              textColor: Color(0xFF91E0A5),
              bannerHeight: 52,
              fontSize: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'FINISH',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Pick a color',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ColorPickerContainer(
                    colors: smartphoneDetails.colors,
                    selectedIndex: currentImageIndex,
                    onTap: (index) {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                    highlightThickness: 4,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'STORAGE',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'How much space do you need?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: smartphoneDetails.storage.length,
                    itemBuilder: (context, index) => StorageCard(
                      storageSize: smartphoneDetails.storage[index],
                      isSelected: selectedStorageIndex == index,
                      onTap: () {
                        setState(() {
                          selectedStorageIndex = index;
                        });
                      },
                    ),
                  ),
                  if (smartphoneDetails.specifications.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      'SPECIFICATIONS',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SpecsCard(
                      specifications: smartphoneDetails.specifications,
                    ),
                  ],
                  const SizedBox(height: 24),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: Colors.grey[100]!, width: 1),
                    ),
                    child: Column(
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isExpanded ? 1.0 : 0.0,
                            child: isExpanded
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      smartphoneDetails.infoImage,
                                      fit: BoxFit.fitWidth,
                                      width: double.infinity,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                                color: Colors.grey[200]!, width: 0.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 2),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: toggleExpanded,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  isExpanded ? 'Show Less' : 'View More',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  isExpanded
                                      ? 'assets/images/up_arrow.svg'
                                      : 'assets/images/down_arrow.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final smartphoneDetails = widget.smartphoneDetails;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF54D8A2), width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'DEVICE PRICE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            smartphoneDetails.devicePrice,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Monthly deduction ${smartphoneDetails.monthlyDeduction}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: const Color(0xFF167E62),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          showEffectivePriceSheet(context, smartphoneDetails),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'EFFECTIVE PRICE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF167E62),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              smartphoneDetails.effectivePrice,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF167E62),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Text(
                                  'Impact in net-salary',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF167E62),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF167E62),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 8,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
