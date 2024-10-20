import 'package:BabBBu/ui/widgets/common/chip/chip_properties.dart';
import 'package:flutter/material.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:BabBBu/ui/theme/colors.dart';

TextStyle getTextStyle(AppChipProperties properties, bool isSelected) {
  TextStyle baseStyle = AppTextStyles.captionNormalSemibold;

  switch (properties) {
    case AppChipProperties.small:
      baseStyle = AppTextStyles.captionNormalSemibold;
    case AppChipProperties.medium:
      baseStyle = AppTextStyles.captionNormalSemibold;
    case AppChipProperties.large:
      baseStyle = AppTextStyles.labelNormalSemibold;
  }

  return baseStyle.copyWith(
    color: isSelected ? AppColors.white : AppColors.secondaryBlue600,
  );
}
