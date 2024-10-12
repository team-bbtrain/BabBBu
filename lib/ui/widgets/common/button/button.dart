import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppButtonSize { medium, small }

enum AppButtonState { defaultState, activated, sub }

class AppButtonProperties {
  final TextStyle textStyle;
  final Size buttonSize;
  final ButtonStyle buttonStyle;

  const AppButtonProperties({
    required this.textStyle,
    required this.buttonSize,
    required this.buttonStyle,
  });

  static AppButtonProperties properties(
    AppButtonSize size,
    AppButtonState state,
  ) {
    if (size == AppButtonSize.medium) {
      if (state == AppButtonState.activated) {
        return AppButtonProperties(
          buttonSize: Size(335.0, 56.0),
          textStyle: AppTextStyles.body1ReadingBold,
          buttonStyle: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(AppColors.primaryOrange500),
            foregroundColor: WidgetStateProperty.all(AppColors.background50),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        );
      } else if (state == AppButtonState.sub) {
        return AppButtonProperties(
          buttonSize: Size(335.0, 56.0),
          textStyle: AppTextStyles.body1ReadingBold,
          buttonStyle: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryOrange50),
            foregroundColor:
                WidgetStateProperty.all(AppColors.primaryOrange500),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        );
      } else {
        return AppButtonProperties(
          buttonSize: Size(335.0, 56.0),
          textStyle: AppTextStyles.body1ReadingBold,
          buttonStyle: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.line200),
            foregroundColor: WidgetStateProperty.all(AppColors.background50),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        );
      }
    } else {
      if (state == AppButtonState.activated) {
        return AppButtonProperties(
          textStyle: AppTextStyles.labelNormalSemibold,
          buttonSize: Size(double.infinity, 34.0),
          buttonStyle: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
            ),
            backgroundColor:
                WidgetStateProperty.all(AppColors.primaryOrange500),
            foregroundColor: WidgetStateProperty.all(AppColors.background50),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        );
      } else if (state == AppButtonState.sub) {
        return AppButtonProperties(
          textStyle: AppTextStyles.labelNormalSemibold,
          buttonSize: Size(double.infinity, 34.0),
          buttonStyle: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
            ),
            backgroundColor: WidgetStateProperty.all(AppColors.primaryOrange50),
            foregroundColor:
                WidgetStateProperty.all(AppColors.primaryOrange500),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        );
      } else {
        return AppButtonProperties(
          textStyle: AppTextStyles.labelNormalSemibold,
          buttonSize: Size(double.infinity, 34.0),
          buttonStyle: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 7.0, horizontal: 16.0),
            ),
            backgroundColor: WidgetStateProperty.all(AppColors.line200),
            foregroundColor: WidgetStateProperty.all(AppColors.background50),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        );
      }
    }
  }
}

class AppButton extends StatelessWidget {
  final String label;
  final AppButtonSize size;
  final AppButtonState state;
  final String? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.label,
    this.size = AppButtonSize.medium,
    this.state = AppButtonState.defaultState,
    this.icon,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final properties = AppButtonProperties.properties(size, state);

    return IntrinsicWidth(
      child: SizedBox(
        width: properties.buttonSize.width,
        height: properties.buttonSize.height,
        child: FilledButton(
          style: properties.buttonStyle,
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                SvgPicture.asset(
                  icon!,
                  width: 24,
                  height: 24,
                  colorFilter: iconColor != null
                      ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(width: 10.0),
              ],
              Text(
                label,
                style: properties.textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
