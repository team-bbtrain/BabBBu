import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/widgets/common/button/button.dart';
import 'package:BabBBu/ui/widgets/common/button/filter_button.dart';
import 'package:BabBBu/ui/widgets/common/button/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 이미지 사용법
              // 2x, 3x 이미지는 준비만 해두면 플러터가 자동으로 디바이스의 해상도에 맞는 이미지를 사용
              Image.asset(
                AppAssets.images.logo,
              ),
              Image.asset(
                AppAssets.images.character,
                width: 200,
              ),
              // ⭐️ 아이콘 사용법
              // 크기 조절
              SvgPicture.asset(
                AppAssets.icons.handEmoji,
                width: 50,
                height: 50,
              ),
              SvgPicture.asset(
                AppAssets.icons.arrowLine,
              ),
              // 색상 변경
              SvgPicture.asset(
                AppAssets.icons.arrowLine,
                colorFilter: ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcIn,
                ),
              ),
              // 회전
              Transform.rotate(
                angle: 3.14,
                child: SvgPicture.asset(
                  AppAssets.icons.arrowLine,
                ),
              ),
              Text(
                'It is a title',
                style: textTheme.titleLarge!.copyWith(
                  color: AppColors.primaryOrange600,
                ),
              ),
              Text(
                'Welcome to Home Screen!',
                style: textTheme.bodyLarge,
              ),
              AppButton(
                label: 'This is Button',
                state: AppButtonState.activated,
                icon: AppAssets.icons.bellDefault,
                iconColor: AppColors.white,
                onPressed: () {},
              ),
              AppButton(
                label: 'small',
                size: AppButtonSize.small,
                onPressed: () {},
              ),
              SocialLoginButton(
                type: SocialLoginButtonType.google,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterButton(label: '서울', isActive: true),
                  FilterButton(label: '경기', isActive: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
