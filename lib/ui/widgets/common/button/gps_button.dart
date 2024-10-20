import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GpsButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const GpsButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x29E0E0E0),
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Color(0x29E0E0E0),
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        child: SvgPicture.asset(
          AppAssets.icons.gpsFixed,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            AppColors.secondaryBlue800,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
