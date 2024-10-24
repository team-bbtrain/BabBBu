import 'package:BabBBu/main.dart';
import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:BabBBu/ui/widgets/common/button/social_login_button.dart';
import 'package:BabBBu/ui/widgets/common/carousel/carousel.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      AppAssets.images.character,
      AppAssets.images.characterWithNote,
      AppAssets.images.logo, // TODO: 임시 이미지
    ];

    return Scaffold(
      backgroundColor: AppColors.background50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              '둘러보기',
              style: AppTextStyles.labelNormalSemibold.copyWith(
                color: AppColors.text200,
              ),
            ),
          ),
        ],
        backgroundColor: AppColors.background50,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            AppCarousel(
              imageUrls: imageUrls,
              textBox: [
                _getTextBox(0),
                _getTextBox(1),
                _getTextBox(2),
              ],
            ),
            SocialLoginButton(
              type: SocialLoginButtonType.naver,
              onPressed: () {}, // TODO: 네이버 회원가입
            ),
            SizedBox(
              height: 12,
            ),
            SocialLoginButton(
              type: SocialLoginButtonType.kakao,
              onPressed: () {}, // TODO: 카카오 회원가입
            ),
            SizedBox(
              height: 12,
            ),
            SocialLoginButton(
              type: SocialLoginButtonType.google,
              onPressed: () {}, // TODO: 구글 회원가입
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '아직 회원이 아니신가요?',
                  style: AppTextStyles.body2NormalMedium.copyWith(
                    color: AppColors.text100,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: () {}, // TODO: 회원가입 페이지로 연결
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    '회원가입',
                    style: AppTextStyles.body2NormalSemibold.copyWith(
                      color: AppColors.text400,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.text400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _getTextBox(int index) {
  String title = '';
  String content = '';

  switch (index) {
    case 0:
      title = '쉽고 빠른 등록';
      content = '기부 물품을 쉽고 빠르게 등록해 보세요';
      break;
    case 1:
      title = '한 눈에 확인';
      content = '이용 가이드로 기부 가능 물품을 조회해 보세요';
      break;
    case 2:
      title = '내 주변 탐색';
      content = '내 주변 푸드뱅크 및 푸드 마켓을 검색해보세요';
      break;
  }

  return Column(
    children: [
      Text(
        title,
        style: AppTextStyles.body1ReadingSemibold.copyWith(
          color: AppColors.text400,
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        content,
        style: AppTextStyles.body2NormalMedium.copyWith(
          color: AppColors.text100,
        ),
      ),
    ],
  );
}
