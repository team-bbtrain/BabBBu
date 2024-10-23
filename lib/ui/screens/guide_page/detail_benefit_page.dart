import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/etc/direction.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:BabBBu/ui/screens/guide_page/guide_page_textstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBenefitPage extends StatelessWidget {
  const DetailBenefitPage({super.key});

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
              angle: Direction.left,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '혜택 상세 안내',
                style: GuidePageTextStyle.detailTitleTextStyle,
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBlue50,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '푸드뱅크/푸드마켓 기부 시 최대 100%까지\n세제 혜택을 받으실 수 있어요.',
                      style: GuidePageTextStyle.questionTextStyle,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      '식품 및 생활용품의 제조업 또는 도소매업을 영위하는\n기업이나 개인이 기부 가능 품목에 해당하는 식품 및\n생활용품을 기부할 경우, 기부자의 세무회계 상 장부가액\n(기부물품 제조에 사용된 비용)을 기준으로 기부식품 등\n영수증을 발급해 드려요.)',
                      style: GuidePageTextStyle.detailbodyTextStyle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '이는 법인세법 시행령 제 19조 및 소득세법 시행령\n제 55조에 따라 기부식품 등 영수증을 발급받아\n전액 필요 경비에 산입할 수 있어요.',
                      style: GuidePageTextStyle.detailbodyTextStyle,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          Uri url = Uri.parse(
                              'https://www.foodbank1377.org/Images/receipt.png');
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
                          '기부식품 등 영수증 예시',
                          style: GuidePageTextStyle.textButtonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
