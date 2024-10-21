import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:BabBBu/ui/widgets/common/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  @override
  _TermsOfUsePageState createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  AppButtonState _buttonState = AppButtonState.defaultState;
  bool allChecked = false;
  bool serviceAgreement = false;
  bool privacyAgreement = false;
  bool adAgreement = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = Color(0xff3D3D3D);
    return Scaffold(
      appBar: AppBar(
        // TODO: 앱바가 은근히~ 길어서 공통 위젯으로 빼도 괜찮을 것 같다! 의견 물어보고 진행해보면 좋을듯
        title: Text(
          '회원가입',
          style: AppTextStyles.body1NormalSemibold.copyWith(
            color: textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background50,

        leading: IconButton(
          iconSize: 24,
          onPressed: () {
            // TODO: 온보딩 화면 생기면, 여기로 다시 돌아가도록 해주자! (뒤로가기 버튼)
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
                color: textColor,
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
            CheckboxListTile(
              title: Text('전체 동의'),
              value: allChecked,
              onChanged: (value) {
                setState(() {
                  allChecked = value!;
                  serviceAgreement = value;
                  privacyAgreement = value;
                  adAgreement = value;
                });
              },
            ),
            Divider(),
            CheckboxListTile(
              title: Text('[필수] 서비스 이용약관'),
              value: serviceAgreement,
              onChanged: (value) {
                setState(() {
                  serviceAgreement = value!;
                  updateAllChecked();
                  updateButtonState();
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              secondary: Icon(Icons.arrow_forward_ios),
            ),
            CheckboxListTile(
              title: Text('[필수] 개인정보 수집 · 이용 동의'),
              value: privacyAgreement,
              onChanged: (value) {
                setState(() {
                  privacyAgreement = value!;
                  updateAllChecked();
                  updateButtonState();
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              secondary: Icon(Icons.arrow_forward_ios),
            ),
            CheckboxListTile(
              title: Text('[선택] 맞춤형 광고 및 개인정보 제공 동의'),
              value: adAgreement,
              onChanged: (value) {
                setState(() {
                  adAgreement = value!;
                  updateAllChecked();
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              secondary: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(
              height: 100, // 238임
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
