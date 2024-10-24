import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';

class GuidePageTextStyle {
  static TextStyle titleTextStyle = AppTextStyles.title2Bold.copyWith(
    color: AppColors.text400,
  );
  static TextStyle bodyTextStyle = AppTextStyles.body2ReadingMedium.copyWith(
    color: AppColors.text200,
  );
  static TextStyle textButtonTextStyle =
      AppTextStyles.labelReadingMedium.copyWith(
    color: AppColors.text100,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.text100,
  );
  static TextStyle buttonTextStyle = AppTextStyles.captionNormalMedium.copyWith(
    color: AppColors.text300,
  );
  static TextStyle questionIconTextStyle =
      AppTextStyles.body2ReadingBold.copyWith(
    color: AppColors.secondaryBlue300,
  );
  static TextStyle questionTextStyle =
      AppTextStyles.body2ReadingSemibold.copyWith(
    color: AppColors.text300,
  );
  static TextStyle detailTitleTextStyle =
      AppTextStyles.heading2Semibold.copyWith(
    color: AppColors.text400,
  );
  static TextStyle detailbodyTextStyle =
      AppTextStyles.labelReadingRegular.copyWith(
    color: AppColors.text200,
  );
}
