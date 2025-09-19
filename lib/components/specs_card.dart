import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tortoise/models/smartphone_details.dart';

class SpecsCard extends StatefulWidget {
  const SpecsCard({
    super.key,
    required this.specifications,
    this.isExpanded = false,
  });

  final List<SpecificationItem> specifications;
  final bool isExpanded;

  @override
  State<SpecsCard> createState() => _SpecsCardState();
}

class _SpecsCardState extends State<SpecsCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show first 3 items by default, all when expanded
    final displayItems = _isExpanded
        ? widget.specifications
        : widget.specifications.take(3).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ...displayItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final spec = entry.value;
                  final isLast = index == displayItems.length - 1;

                  return Column(
                    children: [
                      _buildSpecRow(spec),
                      if (!isLast) const SizedBox(height: 20),
                    ],
                  );
                }),
              ],
            ),
          ),

          // More details section
          if (widget.specifications.length > 3) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DottedLine(
                dashColor: Colors.grey[200]!,
                dashLength: 4,
                dashGapLength: 0,
                lineThickness: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: _toggleExpansion,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _isExpanded ? 'Show less' : 'More details',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF167E62),
                      ),
                    ),
                    SvgPicture.asset(
                      _isExpanded
                          ? 'assets/images/up_arrow.svg'
                          : 'assets/images/down_arrow.svg',
                      width: 26,
                      height: 26,
                    ),
                  ],
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildSpecRow(SpecificationItem spec) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          child: Icon(
            spec.icon,
            size: 20,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spec.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                spec.detail,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
