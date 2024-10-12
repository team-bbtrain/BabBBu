import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SocialLoginButtonType { google, kakao, naver }

class SocialLoginButtonProperties {
  final String icon;
  final Text text;
  final ButtonStyle buttonStyle;

  const SocialLoginButtonProperties({
    required this.icon,
    required this.text,
    required this.buttonStyle,
  });

  static SocialLoginButtonProperties properties(SocialLoginButtonType type) {
    if (type == SocialLoginButtonType.google) {
      return SocialLoginButtonProperties(
        icon: AppAssets.icons.socialGoogle,
        text: Text(
          'Google로 시작하기',
          style: AppTextStyles.body1NormalMedium.copyWith(
            color: Color(0xff0d0d0d),
          ),
        ),
        buttonStyle: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            AppColors.google,
          ),
        ),
      );
    } else if (type == SocialLoginButtonType.kakao) {
      return SocialLoginButtonProperties(
        icon: AppAssets.icons.socialKakao,
        text: Text(
          '카카오로 시작하기',
          style: AppTextStyles.body1NormalMedium.copyWith(
            color: Color(0xff0d0d0d),
          ),
        ),
        buttonStyle: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            AppColors.kakao,
          ),
        ),
      );
    } else {
      return SocialLoginButtonProperties(
        icon: AppAssets.icons.socialNaver,
        text: Text(
          '네이버로 시작하기',
          style: AppTextStyles.body1NormalMedium.copyWith(
            color: AppColors.white,
          ),
        ),
        buttonStyle: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            AppColors.naver,
          ),
        ),
      );
    }
  }
}

class SocialLoginButton extends StatelessWidget {
  final SocialLoginButtonType type;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key,
    required this.type,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final properties = SocialLoginButtonProperties.properties(type);

    return Container(
      width: 327.0,
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FilledButton(
        style: properties.buttonStyle.copyWith(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              properties.icon,
              width: 18,
              height: 18,
            ),
            SizedBox(width: 24.0),
            properties.text,
          ],
        ),
      ),
    );
  }
}
