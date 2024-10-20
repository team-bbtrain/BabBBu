import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip_style.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppChip extends StatelessWidget {
  final String text;
  final AppChipProperties properties;
  final String? leftIcon, rightIcon;
  final VoidCallback? onPressed;
  final bool isSelected;

  const AppChip({
    super.key,
    required this.text,
    required this.properties,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: properties.chipHeight,
      child: ActionChip(
        backgroundColor:
            isSelected ? AppColors.primaryOrange500 : AppColors.line50,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: properties.horizontalPadding,
          vertical: properties.verticalPadding,
        ),
        onPressed: onPressed,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[
              SvgPicture.asset(
                leftIcon!,
                width: properties.iconSize,
                height: properties.iconSize,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.secondaryBlue600,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4),
            ],
            Text(
              text,
              style: getTextStyle(properties, isSelected),
            ),
            if (rightIcon != null) ...[
              SizedBox(width: 4),
              SvgPicture.asset(
                rightIcon!,
                width: properties.iconSize,
                height: properties.iconSize,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.secondaryBlue600,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
