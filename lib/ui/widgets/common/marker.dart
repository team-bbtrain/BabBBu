import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppMarker extends StatelessWidget {
  final String label, subLabel, icon;
  final double squareWidth, squareHeight, triangleWidth, triangleHeight, border;
  final double iconSize;
  final double circleSize;

  const AppMarker({
    super.key,
    required this.label,
    required this.icon,
    required this.subLabel,
    this.squareWidth = 144,
    this.squareHeight = 52,
    this.triangleWidth = 14,
    this.triangleHeight = 11,
    this.iconSize = 20,
    this.circleSize = 40,
    this.border = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
          painter: MarkerPainter(
            squareWidth: squareWidth,
            squareHeight: squareHeight,
            triangleWidth: triangleWidth,
            triangleHeight: triangleHeight,
            border: border,
          ),
          child: Row(
            children: [
              Text('icon'),
              Text('data'),
            ],
          )),
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
