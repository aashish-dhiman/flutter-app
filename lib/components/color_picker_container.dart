import 'package:flutter/material.dart';

class ColorPickerContainer extends StatelessWidget {
  const ColorPickerContainer({
    super.key,
    required this.colors,
    required this.onTap,
    this.selectedIndex = 0,
    this.colorSize = 50.0,
    this.spacing = 12.0,
    this.highlightThickness = 3.0,
  });

  final List<Color> colors;
  final Function(int index) onTap;
  final int selectedIndex;
  final double colorSize;
  final double spacing;
  final double highlightThickness;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        colors.length,
        (index) => _buildColorPicker(colors[index], index),
      ),
    );
  }

  Widget _buildColorPicker(Color color, int index) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: colorSize,
        height: colorSize,
        margin: EdgeInsets.only(right: index < colors.length - 1 ? spacing : 0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected
              ? Border.all(
                  color: Colors.green,
                  width: highlightThickness,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 8,
              spreadRadius: -4,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
      ),
    );
  }
}
