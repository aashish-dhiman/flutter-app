import 'package:flutter/material.dart';

class StorageCard extends StatelessWidget {
  const StorageCard({
    super.key,
    required this.storageSize,
    required this.isSelected,
    required this.onTap,
    this.width = 140,
    this.height = 60,
  });

  final String storageSize;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : Colors.grey[300]!,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF4CAF50)
                        : Colors.grey[400]!,
                    width: 2,
                  ),
                  color:
                      isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 8,
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Text(
                storageSize,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
