import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip_style.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class AppChipFilter extends StatelessWidget {
  final String text;
  final AppChipProperties properties;
  final VoidCallback? onPressed;
  final bool isSelected;

  const AppChipFilter({
    super.key,
    required this.text,
    required this.properties,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: properties.chipHeight,
      child: ActionChip(
        backgroundColor:
            isSelected ? AppColors.primaryOrange50 : AppColors.white,
        side: BorderSide(
          width: properties.border,
          color: isSelected
              ? AppColors.primaryOrange200
              : AppColors.secondaryBlue100,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.fromLTRB(
          properties.horizontalPadding + 5,
          properties.verticalPadding,
          properties.horizontalPadding,
          properties.verticalPadding,
        ),
        onPressed: onPressed,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: getTextStyle(properties, isSelected),
            ),
            SizedBox(
              width: 4,
            ),
            Transform.rotate(
              angle: math.pi,
              child: SvgPicture.asset(
                AppAssets.icons.arrowLine2,
                width: properties.iconSize,
                height: properties.iconSize,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primaryOrange500 : AppColors.text100,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
