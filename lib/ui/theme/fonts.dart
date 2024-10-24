import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle _baseTextStyle({
    required double fontSize,
    required double height,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: height / fontSize, // 줄 높이를 비율로 계산
      fontWeight: fontWeight,
      fontFamily: 'Pretendard', // 공통 폰트 패밀리
    );
  }

  // Title 1 (24px / 32px)
  static TextStyle title1Bold =
      _baseTextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.w700);
  static TextStyle title1Semibold =
      _baseTextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.w600);
  static TextStyle title1Medium =
      _baseTextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.w500);
  static TextStyle title1Regular =
      _baseTextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.w400);
  static TextStyle title1Light =
      _baseTextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.w300);

  // Title 2 (22px / 28px)
  static TextStyle title2Bold =
      _baseTextStyle(fontSize: 22, height: 28, fontWeight: FontWeight.w700);
  static TextStyle title2Semibold =
      _baseTextStyle(fontSize: 22, height: 28, fontWeight: FontWeight.w600);
  static TextStyle title2Medium =
      _baseTextStyle(fontSize: 22, height: 28, fontWeight: FontWeight.w500);
  static TextStyle title2Regular =
      _baseTextStyle(fontSize: 22, height: 28, fontWeight: FontWeight.w400);
  static TextStyle title2Light =
      _baseTextStyle(fontSize: 22, height: 28, fontWeight: FontWeight.w300);

  // Heading 1 (20px / 26px)
  static TextStyle heading1Bold =
      _baseTextStyle(fontSize: 20, height: 26, fontWeight: FontWeight.w700);
  static TextStyle heading1Semibold =
      _baseTextStyle(fontSize: 20, height: 26, fontWeight: FontWeight.w600);
  static TextStyle heading1Medium =
      _baseTextStyle(fontSize: 20, height: 26, fontWeight: FontWeight.w500);
  static TextStyle heading1Regular =
      _baseTextStyle(fontSize: 20, height: 26, fontWeight: FontWeight.w400);
  static TextStyle heading1Light =
      _baseTextStyle(fontSize: 20, height: 26, fontWeight: FontWeight.w300);

  // Heading 2 (18px / 24px)
  static TextStyle heading2Bold =
      _baseTextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w700);
  static TextStyle heading2Semibold =
      _baseTextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w600);
  static TextStyle heading2Medium =
      _baseTextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w500);
  static TextStyle heading2Regular =
      _baseTextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w400);
  static TextStyle heading2Light =
      _baseTextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w300);

  // Body 1 Normal (16px / 20px)
  static TextStyle body1NormalBold =
      _baseTextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w700);
  static TextStyle body1NormalSemibold =
      _baseTextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w600);
  static TextStyle body1NormalMedium =
      _baseTextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w500);
  static TextStyle body1NormalRegular =
      _baseTextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w400);
  static TextStyle body1NormalLight =
      _baseTextStyle(fontSize: 16, height: 20, fontWeight: FontWeight.w300);

  // Body 1 Reading (16px / 26px)
  static TextStyle body1ReadingBold =
      _baseTextStyle(fontSize: 16, height: 26, fontWeight: FontWeight.w700);
  static TextStyle body1ReadingSemibold =
      _baseTextStyle(fontSize: 16, height: 26, fontWeight: FontWeight.w600);
  static TextStyle body1ReadingMedium =
      _baseTextStyle(fontSize: 16, height: 26, fontWeight: FontWeight.w500);
  static TextStyle body1ReadingRegular =
      _baseTextStyle(fontSize: 16, height: 26, fontWeight: FontWeight.w400);
  static TextStyle body1ReadingLight =
      _baseTextStyle(fontSize: 16, height: 26, fontWeight: FontWeight.w300);

  // Body 2 Normal (14px / 20px)
  static TextStyle body2NormalBold =
      _baseTextStyle(fontSize: 14, height: 20, fontWeight: FontWeight.w700);
  static TextStyle body2NormalSemibold =
      _baseTextStyle(fontSize: 14, height: 20, fontWeight: FontWeight.w600);
  static TextStyle body2NormalMedium =
      _baseTextStyle(fontSize: 14, height: 20, fontWeight: FontWeight.w500);
  static TextStyle body2NormalRegular =
      _baseTextStyle(fontSize: 14, height: 20, fontWeight: FontWeight.w400);
  static TextStyle body2NormalLight =
      _baseTextStyle(fontSize: 14, height: 20, fontWeight: FontWeight.w300);

  // Body 2 Reading (14px / 24px)
  static TextStyle body2ReadingBold =
      _baseTextStyle(fontSize: 14, height: 24, fontWeight: FontWeight.w700);
  static TextStyle body2ReadingSemibold =
      _baseTextStyle(fontSize: 14, height: 24, fontWeight: FontWeight.w600);
  static TextStyle body2ReadingMedium =
      _baseTextStyle(fontSize: 14, height: 24, fontWeight: FontWeight.w500);
  static TextStyle body2ReadingRegular =
      _baseTextStyle(fontSize: 14, height: 24, fontWeight: FontWeight.w400);
  static TextStyle body2ReadingLight =
      _baseTextStyle(fontSize: 14, height: 24, fontWeight: FontWeight.w300);

  // Label Normal (13px / 18px)
  static TextStyle labelNormalBold =
      _baseTextStyle(fontSize: 13, height: 18, fontWeight: FontWeight.w700);
  static TextStyle labelNormalSemibold =
      _baseTextStyle(fontSize: 13, height: 18, fontWeight: FontWeight.w600);
  static TextStyle labelNormalMedium =
      _baseTextStyle(fontSize: 13, height: 18, fontWeight: FontWeight.w500);
  static TextStyle labelNormalRegular =
      _baseTextStyle(fontSize: 13, height: 18, fontWeight: FontWeight.w400);
  static TextStyle labelNormalLight =
      _baseTextStyle(fontSize: 13, height: 18, fontWeight: FontWeight.w300);

  // Label Reading (13px / 20px)
  static TextStyle labelReadingBold =
      _baseTextStyle(fontSize: 13, height: 20, fontWeight: FontWeight.w700);
  static TextStyle labelReadingSemibold =
      _baseTextStyle(fontSize: 13, height: 20, fontWeight: FontWeight.w600);
  static TextStyle labelReadingMedium =
      _baseTextStyle(fontSize: 13, height: 20, fontWeight: FontWeight.w500);
  static TextStyle labelReadingRegular =
      _baseTextStyle(fontSize: 13, height: 20, fontWeight: FontWeight.w400);
  static TextStyle labelReadingLight =
      _baseTextStyle(fontSize: 13, height: 20, fontWeight: FontWeight.w300);

  // Caption Normal (12px / 18px)
  static TextStyle captionNormalBold =
      _baseTextStyle(fontSize: 12, height: 18, fontWeight: FontWeight.w700);
  static TextStyle captionNormalSemibold =
      _baseTextStyle(fontSize: 12, height: 18, fontWeight: FontWeight.w600);
  static TextStyle captionNormalMedium =
      _baseTextStyle(fontSize: 12, height: 18, fontWeight: FontWeight.w500);
  static TextStyle captionNormalRegular =
      _baseTextStyle(fontSize: 12, height: 18, fontWeight: FontWeight.w400);
  static TextStyle captionNormalLight =
      _baseTextStyle(fontSize: 12, height: 18, fontWeight: FontWeight.w300);

  // Caption Reading (12px / 20px)
  static TextStyle captionReadingBold =
      _baseTextStyle(fontSize: 12, height: 20, fontWeight: FontWeight.w700);
  static TextStyle captionReadingSemibold =
      _baseTextStyle(fontSize: 12, height: 20, fontWeight: FontWeight.w600);
  static TextStyle captionReadingMedium =
      _baseTextStyle(fontSize: 12, height: 20, fontWeight: FontWeight.w500);
  static TextStyle captionReadingRegular =
      _baseTextStyle(fontSize: 12, height: 20, fontWeight: FontWeight.w400);
  static TextStyle captionReadingLight =
      _baseTextStyle(fontSize: 12, height: 20, fontWeight: FontWeight.w300);

  static TextTheme get textTheme => TextTheme(
      headlineLarge: title1Bold,
      headlineMedium: title2Bold,
      headlineSmall: heading1Bold,
      titleLarge: heading1Bold,
      titleMedium: heading2Bold,
      titleSmall: body1NormalBold,
      bodyLarge: body1NormalLight,
      bodyMedium: body2NormalLight,
      bodySmall: labelNormalLight,
      labelLarge: labelReadingLight,
      labelMedium: labelNormalLight);
}
