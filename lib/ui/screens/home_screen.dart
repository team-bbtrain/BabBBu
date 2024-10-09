import 'package:BabBBu/ui/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Home Screen!'),
            // ⭐️ 아이콘 사용법
            SvgPicture.asset(
              AppAssets.icons.arrowLine,
            ),
            // 크기 조절
            SvgPicture.asset(
              AppAssets.icons.handEmoji,
              width: 50,
              height: 50,
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
          ],
        ),
      ),
    );
  }
}
