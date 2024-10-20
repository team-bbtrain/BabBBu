import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingButton extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback? onPressed;

  const FloatingButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      decoration: BoxDecoration(
        color: AppColors.secondaryBlue950,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x29323232),
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Color(0x29323232),
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.line50,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              label,
              style: AppTextStyles.labelNormalSemibold.copyWith(
                color: AppColors.line50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
