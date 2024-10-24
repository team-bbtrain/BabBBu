import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';

class GuidePageTextStyle {
  // 큰 제목: ex) 기부에 관심이 있어요!
  static TextStyle titleTextStyle = AppTextStyles.title1Bold.copyWith(
    color: AppColors.text400,
  );
  // 페이지 소개 본문
  static TextStyle bodyTextStyle = AppTextStyles.body1ReadingMedium.copyWith(
    color: AppColors.text200,
  );
  // 텍스트 버튼에 들어가는 텍스트
  static TextStyle textButtonTextStyle =
      AppTextStyles.body2ReadingMedium.copyWith(
    color: AppColors.text100,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.text100,
  );
  // 버튼에 들어가는 텍스트
  static TextStyle buttonTextStyle = AppTextStyles.labelNormalMedium.copyWith(
    color: AppColors.text300,
  );
  // Q 마크
  static TextStyle questionIconTextStyle = AppTextStyles.heading2Bold.copyWith(
    color: AppColors.secondaryBlue300,
  );
  // Q 마크 뒤의 질문
  static TextStyle questionTextStyle = AppTextStyles.heading2Semibold.copyWith(
    color: AppColors.text400,
  );
  // Q 마크 내의 답변
  static TextStyle questionAnswerTextStyle =
      AppTextStyles.body1ReadingRegular.copyWith(
    color: AppColors.text200,
  );
  // 기부 상세 혜택 페이지: 제목
  static TextStyle detailTitleTextStyle = AppTextStyles.title2Semibold.copyWith(
    color: AppColors.text400,
  );
  // 기부 상세 혜택 페이지: 소제목
  static TextStyle detailSubTitleTextStyle =
      AppTextStyles.heading2Semibold.copyWith(
    color: AppColors.text300,
  );
  // 기부 상세 혜택 페이지: 본문
  static TextStyle detailbodyTextStyle =
      AppTextStyles.body1ReadingRegular.copyWith(
    color: AppColors.text200,
  );
}
