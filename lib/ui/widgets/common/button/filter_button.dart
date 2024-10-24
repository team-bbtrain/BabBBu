import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback? onPressed;

  const FilterButton({
    super.key,
    required this.label,
    this.isActive = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        fixedSize: Size(105, 64),
        backgroundColor:
            isActive ? AppColors.primaryOrange50 : AppColors.background100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        side: BorderSide(
          color:
              isActive ? AppColors.primaryOrange400 : AppColors.background200,
        ),
      ),
      child: Text(
        label,
        style: isActive
            ? AppTextStyles.body2NormalSemibold.copyWith(
                color: AppColors.primaryOrange500,
              )
            : AppTextStyles.body2NormalMedium.copyWith(
                color: AppColors.text50,
              ),
      ),
    );
  }
}
