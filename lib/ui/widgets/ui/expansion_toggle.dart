import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/etc/direction.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppExpansionTile extends StatefulWidget {
  final String title;
  final String content;
  final String? subtitle;

  const AppExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.subtitle,
  });

  @override
  _AppExpansionTileState createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isExpanded
                  ? Transform.rotate(
                      angle: Direction.down,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          AppAssets.icons.arrowFilled,
                          colorFilter: ColorFilter.mode(
                            AppColors.secondaryBlue800,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : Transform.rotate(
                      angle: Direction.right,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          AppAssets.icons.arrowFilled,
                          colorFilter: ColorFilter.mode(
                            AppColors.secondaryBlue800,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.body2NormalMedium.copyWith(
                      color: AppColors.text300,
                    ),
                  ),
                  if (widget.subtitle != null)
                    Text(
                      widget.subtitle!,
                      style: AppTextStyles.body2NormalMedium.copyWith(
                        color: AppColors.text100,
                      ),
                    ),
                ],
              ),
            ],
          ),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        AnimatedSize(
          // TODO: 안에 들어갈 내용 부분에 대한 상세 설정
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            height: isExpanded ? null : 0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: isExpanded ? Text(widget.content) : null,
          ),
        ),
      ],
    );
  }
}
