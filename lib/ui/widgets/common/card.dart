import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String? subTitle, businessHours, address, imageUrl;
  const AppCard({
    super.key,
    required this.title,
    this.subTitle,
    this.businessHours,
    this.address,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 335,
            height: 164,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: imageUrl != null ? null : const Color(0xFFD9D9D9),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: AppTextStyles.body1NormalSemibold,
          ),
          SizedBox(
            height: 8,
          ),
          Text(subTitle ?? '', style: AppTextStyles.body2NormalRegular),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            _buildChip(
              icon: AppAssets.icons.alarmClock20,
              label: businessHours,
            ),
            SizedBox(
              width: 8,
            ),
            _buildChip(icon: AppAssets.icons.location20, label: address),
          ]),
        ],
      ),
    );
  }
}

Widget _buildChip({required String icon, String? label}) {
  return SizedBox(
    height: 24,
    child: Chip(
      backgroundColor: AppColors.secondaryBlue50,
      label: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                    AppColors.secondaryBlue300, BlendMode.srcIn),
              ),
              SizedBox(width: 4),
              Text(
                label ?? '정보없음',
                style: AppTextStyles.captionReadingRegular
                    .copyWith(color: AppColors.text200),
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 6,
      ),
      side: BorderSide.none,
    ),
  );
}
