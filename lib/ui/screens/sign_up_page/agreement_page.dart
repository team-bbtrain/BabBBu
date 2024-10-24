import 'package:BabBBu/main.dart';
import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/screens/home_screen.dart';
import 'package:BabBBu/ui/screens/sign_up_page/ad_page.dart';
import 'package:BabBBu/ui/screens/sign_up_page/privacy_page.dart';
import 'package:BabBBu/ui/screens/sign_up_page/terms_of_use_page.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:BabBBu/ui/widgets/common/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ScreenName {
  termsOfUse,
  privacy,
  ad,
}

class AgreementPage extends StatefulWidget {
  const AgreementPage({super.key});

  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  AppButtonState _buttonState = AppButtonState.defaultState;
  bool allChecked = false;
  bool serviceAgreement = false;
  bool privacyAgreement = false;
  bool adAgreement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
          style: AppTextStyles.body1NormalSemibold.copyWith(
            color: AppColors.text400,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background50,
        leading: IconButton(
          iconSize: 24,
          onPressed: () {
            // Navigator.pop(context); TODO: 온보딩 화면 생긴 이후에 주석 해제
          },
          icon: Transform.rotate(
            angle: 270 * 3.14 / 180,
            child: SvgPicture.asset(
              AppAssets.icons.arrowLine,
              colorFilter: ColorFilter.mode(
                Color(0xff292929),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          100,
          20,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '밥뿌에 오신 것을\n환영합니다!',
              style: AppTextStyles.title1Semibold.copyWith(
                color: AppColors.text300,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '보다 나은 밥뿌 서비스 사용을 위해\n가입 및 정보 제공에 동의해 주세요.',
              style: AppTextStyles.body2NormalRegular.copyWith(
                color: Color(0xff989898),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _moveScreen(context, ScreenName.termsOfUse);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('전체 동의'),
                      ],
                    ),
                  ),
                ),
                Checkbox(
                  value: allChecked,
                  onChanged: (value) {
                    setState(() {
                      allChecked = value!;
                      serviceAgreement = value;
                      privacyAgreement = value;
                      adAgreement = value;
                      updateAllChecked();
                      updateButtonState();
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: serviceAgreement,
                  onChanged: (value) {
                    setState(() {
                      serviceAgreement = value!;
                      updateAllChecked();
                      updateButtonState();
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _moveScreen(context, ScreenName.termsOfUse);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('[필수] 서비스 이용약관'),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: privacyAgreement,
                  onChanged: (value) {
                    setState(() {
                      privacyAgreement = value!;
                      updateAllChecked();
                      updateButtonState();
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _moveScreen(context, ScreenName.privacy);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('[필수] 개인정보 수집 · 이용 동의'),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: adAgreement,
                  onChanged: (value) {
                    setState(() {
                      adAgreement = value!;
                      updateAllChecked();
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _moveScreen(context, ScreenName.ad);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('[선택] 맞춤형 광고 및 개인정보 제공 동의'),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100, // TODO: NavigationBar 없애고 238로 수정해야함
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onPressed: serviceAgreement && privacyAgreement
                      ? () {
                          // TODO: 확인 버튼 클릭시 다음 페이지로 넘어감
                        }
                      : null,
                  state: _buttonState,
                  label: '확인',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateAllChecked() {
    setState(() {
      allChecked = serviceAgreement && privacyAgreement && adAgreement;
    });
  }

  void updateButtonState() {
    setState(() {
      if (serviceAgreement && privacyAgreement) {
        _buttonState = AppButtonState.activated;
      } else {
        _buttonState = AppButtonState.defaultState;
      }
    });
  }
}

void _moveScreen(BuildContext context, ScreenName screenName) {
  switch (screenName) {
    case ScreenName.termsOfUse:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TermsOfUsePage()),
      );
      break;
    case ScreenName.privacy:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrivacyPage()),
      );
      break;
    case ScreenName.ad:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdPage()),
      );
      break;
  }
}
