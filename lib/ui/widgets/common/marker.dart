import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppMarker extends StatelessWidget {
  final String label, subLabel, icon;
  final double x, y;

  const AppMarker({
    super.key,
    required this.label,
    required this.icon,
    required this.subLabel,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        x,
        y,
      ),
      child: SizedBox(
        child: CustomPaint(
          painter: MarkerPainter(
            squareWidth: 144,
            squareHeight: 52,
            triangleWidth: 14,
            triangleHeight: 11,
            border: 1.5,
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 6, 14, 6),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  icon,
                  colorFilter:
                      ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 76,
                      ),
                      child: Text(
                        label,
                        style: AppTextStyles.captionNormalSemibold.copyWith(
                          color: AppColors.text400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 76,
                      ),
                      child: Text(
                        subLabel,
                        style: AppTextStyles.captionNormalMedium.copyWith(
                          color: AppColors.primaryOrange500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MarkerPainter extends CustomPainter {
  final double squareWidth, squareHeight, triangleWidth, triangleHeight, border;

  MarkerPainter({
    required this.squareWidth,
    required this.squareHeight,
    required this.triangleWidth,
    required this.triangleHeight,
    required this.border,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColors.white;

    // 둥근 사각형 그리기
    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        0,
        squareWidth,
        squareHeight,
      ),
      Radius.circular(100),
    );
    canvas.drawRRect(roundedRect, paint);

    // 아래로 향한 삼각형 그리기
    final Path trianglePath = Path()
      ..moveTo(squareWidth / 2 - triangleWidth / 2, squareHeight) // 삼각형 왼쪽 점
      ..lineTo(squareWidth / 2, squareHeight + triangleHeight) // 삼각형 아래쪽 점 (중심)
      ..lineTo(squareWidth / 2 + triangleWidth / 2, squareHeight); // 삼각형 오른쪽 점
    canvas.drawPath(trianglePath, paint);

    // 겹치는 부분
    final Path bondingPath = Path()
      ..moveTo(squareWidth / 2 - triangleWidth / 2, squareHeight) // 삼각형 왼쪽 점
      ..lineTo(squareWidth / 2 + triangleWidth / 2, squareHeight); // 삼각형 오른쪽 점

    // 테두리 추가
    final Paint borderPaint = Paint()
      ..color = AppColors.primaryOrange500
      ..style = PaintingStyle.stroke
      ..strokeWidth = border;
    final Paint bondingPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = border;
    canvas.drawRRect(roundedRect, borderPaint);
    canvas.drawPath(trianglePath, borderPaint);
    canvas.drawPath(bondingPath, bondingPaint);

    // 동그라미 그리기
    canvas.drawCircle(
        Offset(26, 26),
        20,
        Paint()
          ..color = AppColors.primaryOrange500
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
