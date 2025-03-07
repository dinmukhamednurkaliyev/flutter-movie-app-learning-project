import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class SelectableOptionWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableOptionWidget({
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.primary : AppColors.secondaryBackground,
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
