import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';

enum AppCardType {
  type1,
  type2,
}

class AppCardProperties {
  final Color? cardColor;
  final double imageWidth;
  final Color tagFontColor;

  const AppCardProperties({
    this.cardColor,
    required this.imageWidth,
    required this.tagFontColor,
  });

  static AppCardProperties properties(AppCardType type) {
    switch (type) {
      case AppCardType.type1:
        return const AppCardProperties(
            cardColor: null, imageWidth: 335, tagFontColor: AppColors.text200);
      case AppCardType.type2:
        return const AppCardProperties(
            cardColor: AppColors.white,
            imageWidth: 311,
            tagFontColor: AppColors.text400);
    }
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
