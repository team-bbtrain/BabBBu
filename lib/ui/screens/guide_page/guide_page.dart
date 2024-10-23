import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/screens/guide_page/detail_benefit_page.dart';
import 'package:BabBBu/ui/screens/home_screen.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip.dart';
import 'package:BabBBu/ui/widgets/common/chip/chip_properties.dart';
import 'package:BabBBu/ui/widgets/common/chip/select_chip.dart';
import 'package:BabBBu/ui/widgets/ui/expansion_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:BabBBu/ui/screens/guide_page/guide_page_textstyle.dart';

enum ScreenName {
  donateLogic,
  detailBenefit,
  map,
  main,
}

class ServiceGuidePage extends StatefulWidget {
  const ServiceGuidePage({super.key});

  @override
  _ServiceGuidePageState createState() => _ServiceGuidePageState();
}

class _ServiceGuidePageState extends State<ServiceGuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background50,
      appBar: AppBar(
        title: Text(
          '서비스 가이드',
          style: AppTextStyles.body1NormalSemibold.copyWith(
            color: AppColors.text400,
          ),
        ),
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
            _moveScreen(context, ScreenName.main);
          },
          icon: SvgPicture.asset(
            AppAssets.icons.closeLine,
            colorFilter: ColorFilter.mode(
              AppColors.text400,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  0,
                  28,
                ),
                child: AppSelectChip(
                  chipBarSpace: 8,
                  initialSelectedIndex: 0,
                  appChips: [
                    AppChip(
                      text: '푸드뱅크란?',
                      properties: AppChipProperties.medium,
                    ),
                    AppChip(
                      text: '밥뿌를 소개해요',
                      properties: AppChipProperties.medium,
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              AppAssets.images.serviceGuide,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '푸드뱅크가\n무엇인가요?',
                      style: GuidePageTextStyle.titleTextStyle,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      '푸드뱅크는 식품 및 생활용품을 기부받아\n결식아동, 독거노인 등 소외 계층에게\n지원하는 나눔제도에요.',
                      style: GuidePageTextStyle.bodyTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '보건복지부 산하 공공기관인\n한국사회복지협의회에서 위탁 사업을 수행하며\n식품 등 기부 활성화에 관한 법률에 근거하여\n사회 공동체 문화 확산에 이바지하고 있어요.',
                      style: GuidePageTextStyle.bodyTextStyle,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () async {
                        Uri url = Uri.parse(
                            'https://www.foodbank1377.org/introduce/foodbank.do');
                        if (!await launchUrl(url)) {
                          throw Exception('현재 페이지에 접속할 수 없어요');
                        }
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '더 알아보기',
                        style: GuidePageTextStyle.textButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
              width: double.infinity,
              color: AppColors.line50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '기부에\n관심이 있어요!',
                      style: GuidePageTextStyle.titleTextStyle,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    _getQuestionBox(
                      context,
                      '구체적으로 무엇을 기부할 수 있나요?',
                      '이용자에게 안전하게 제공할 수 있는 대부분의 식품과\n생활용품을 기부받아요.\n단, 유통기한이나 신선도, 사용기한에 따라\n제약이 있을 수 있어요.',
                      '내 물건 기부 가능한지 확인하기',
                      ScreenName.donateLogic,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppExpansionTile(
                        title: '식품별 모집 가능 기한 및 배분 기한', content: '뭔가 내용이 있겠쥬?'),
                    AppExpansionTile(
                      title: '생활용품별 모집 가능 기한 및 배분 기한',
                      subtitle: '(사용 기한이 표시된 물품에 한함)',
                      content: '얘도 내용이 있겠쥬?',
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    _getQuestionBox(
                      context,
                      '뉴스에 보면 박스 단위로 기부하던데,\n낱개도 기부가 가능한가요?',
                      '당연하죠! 작은 단위의 기부물품이 모여\n누군가의 소중한 한 끼 식사가 될 수 있답니다.',
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    _getQuestionBox(
                      context,
                      '어떤 혜택이 있나요?',
                      '푸드뱅크/푸드마켓 기부 시 최대 100%까지\n세제 혜택을 받으실 수 있어요.',
                      '자세히 보기',
                      ScreenName.detailBenefit,
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    _getQuestionBox(
                      context,
                      '어디에 기부를 하면 되나요?',
                      '어려운 이웃에게 기부 물품을 전달하는 푸드뱅크와\n저소득층이 직접 매장에 방문하여\n기부물품을 구입하는 방식의 푸드마켓이\n전국 곳곳에서 온정을 기다리고 있어요!',
                      '내 근처 기부처 찾아보기',
                      ScreenName.map,
                    ),
                    SizedBox(
                      height: 68,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getQuestionBox(
  BuildContext context,
  title,
  String content, [
  String? buttonText,
  ScreenName? destination,
]) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Q',
            style: GuidePageTextStyle.questionIconTextStyle,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: GuidePageTextStyle.questionTextStyle,
          ),
        ],
      ),
      SizedBox(
        height: 16,
      ),
      IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              color: AppColors.secondaryBlue100,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: GuidePageTextStyle.bodyTextStyle,
                ),
                if (buttonText != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _moveScreen(
                            context,
                            destination!,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.secondaryBlue100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          buttonText,
                          style: GuidePageTextStyle.buttonTextStyle,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

void _moveScreen(BuildContext context, ScreenName screenName) {
  switch (screenName) {
    case ScreenName.donateLogic:
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()), // TODO: 기부로직 화면으로 연결
      );
      break;
    case ScreenName.detailBenefit:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailBenefitPage()),
      );
      break;
    case ScreenName.map:
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()), // TODO: 기부로직 화면으로 연결
      );
      break;
    case ScreenName.main:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
  }
}
