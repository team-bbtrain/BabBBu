import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  BottomNavigationBarItem _buildNavItem(
      String iconPath, int index, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 24,
        colorFilter: ColorFilter.mode(
          currentIndex == index
              ? AppColors.secondaryBlue600
              : AppColors.line200,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: AppColors.background100,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: AppColors.background100,
          unselectedLabelStyle: AppTextStyles.captionNormalMedium.copyWith(
            color: AppColors.line200,
          ),
          selectedLabelStyle: AppTextStyles.captionNormalMedium.copyWith(
            color: AppColors.secondaryBlue800,
          ),
          useLegacyColorScheme: false,
          iconSize: 24,
          fixedColor: AppColors.secondaryBlue800,
          unselectedItemColor: AppColors.line200,
          items: [
            _buildNavItem(AppAssets.icons.home, 0, '홈'),
            _buildNavItem(AppAssets.icons.searchFilled, 1, '검색'),
            _buildNavItem(AppAssets.icons.user, 2, '마이'),
            _buildNavItem(AppAssets.icons.timeCircle, 3, '시간'),
          ],
        ),
      ),
    );
  }
}
