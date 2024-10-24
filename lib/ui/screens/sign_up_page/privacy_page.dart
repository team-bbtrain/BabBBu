import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background50,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: AppColors.line50,
            width: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background50,
        leading: IconButton(
          iconSize: 24,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Transform.rotate(
            //angle: Direction.left,
            angle: 3.14 * 2 / 3, // TODO: 추후 수정
            child: SvgPicture.asset(
              AppAssets.icons.arrowLine,
              colorFilter: ColorFilter.mode(
                AppColors.text400,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 42,
        ),
        child: Text(
          '개인정보 페이지!',
        ),
      ),
    );
  }
}
