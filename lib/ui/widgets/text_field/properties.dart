import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/painting.dart';

class TextFieldProperties {
  final double height;
  final double? border;
  final double borderRadius;
  final TextStyle textStyle;
  final double verticalPadding;
  final double horizontalPadding;

  const TextFieldProperties({
    required this.height,
    this.border,
    required this.textStyle,
    required this.borderRadius,
    required this.verticalPadding,
    required this.horizontalPadding,
  });

  static final TextFieldProperties lg = TextFieldProperties(
    height: 54,
    textStyle: AppTextStyles.body2NormalMedium,
    borderRadius: 12,
    verticalPadding: 18,
    horizontalPadding: 16,
  );

  static final TextFieldProperties md = TextFieldProperties(
    height: 48,
    textStyle: AppTextStyles.body2NormalMedium,
    borderRadius: 10,
    verticalPadding: 18,
    horizontalPadding: 16,
  );

  static final TextFieldProperties sm = TextFieldProperties(
    height: 40,
    textStyle: AppTextStyles.labelNormalMedium,
    borderRadius: 8,
    verticalPadding: 18,
    horizontalPadding: 16,
  );
}
