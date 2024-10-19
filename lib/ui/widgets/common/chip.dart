import 'dart:developer';

import 'package:BabBBu/ui/theme/colors.dart';
import 'package:BabBBu/ui/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppChipSize {
  medium,
  large,
}

class AppChipProperties {
  final double chipHeight;
  final double iconSize;

  const AppChipProperties({
    required this.chipHeight,
    required this.iconSize,
  });

  static AppChipProperties properties(AppChipSize size) {
    switch (size) {
      case AppChipSize.medium:
        return const AppChipProperties(chipHeight: 40, iconSize: 20);
      case AppChipSize.large:
        return const AppChipProperties(chipHeight: 44, iconSize: 24);
    }
  }
}

class AppChip extends StatefulWidget {
  final String text;
  final AppChipSize size;
  final String? leftIcon, rightIcon;
  final VoidCallback? onPressed;
  final bool? isSelected; // null일 경우 내부 상태로 관리

  const AppChip({
    super.key,
    required this.text,
    required this.size,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.isSelected, // 선택 상태를 외부에서 전달받을 수 있음
  });

  @override
  State<AppChip> createState() => _AppChipState();
}

class _AppChipState extends State<AppChip> {
  bool _internalIsSelected = false; // 내부 상태 관리

  @override
  void initState() {
    super.initState();
    _internalIsSelected = widget.isSelected ?? false; // 내부 상태 초기화
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        widget.isSelected ?? _internalIsSelected; // 외부 또는 내부 상태 사용

    return SizedBox(
      height: AppChipProperties.properties(widget.size).chipHeight,
      child: ActionChip(
        backgroundColor:
            isSelected ? AppColors.primaryOrange500 : AppColors.line50,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (widget.isSelected == null) {
            setState(() {
              _internalIsSelected = !_internalIsSelected; // 내부 상태 변경
            });
          }
          widget.onPressed?.call();
        },
        label: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.leftIcon != null) ...[
              SvgPicture.asset(
                widget.leftIcon!,
                width: AppChipProperties.properties(widget.size).iconSize,
                height: AppChipProperties.properties(widget.size).iconSize,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.secondaryBlue600,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4),
            ],
            Text(widget.text, style: _getTextStyle(widget.size, isSelected)),
            if (widget.rightIcon != null) ...[
              SizedBox(width: 4),
              SvgPicture.asset(
                widget.rightIcon!,
                width: AppChipProperties.properties(widget.size).iconSize,
                height: AppChipProperties.properties(widget.size).iconSize,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.secondaryBlue600,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AppSelectChip extends StatefulWidget {
  final double chipBarWidth, chipBarHeight, chipBarPadding, chipBarSpace;
  final List<AppChip> appChips;
  final bool multipleSelection;
  // 단수 선택 옵션
  final int? initialSelectedIndex; // 선택된 인덱스
  final ValueChanged<int>? onSingleSelectionChanged;
  // 복수 선택 옵션
  final List<int>? initialSelectedIndexes; // 선택된 인덱스 리스트
  final ValueChanged<List<int>>? onMultipleSelectionChanged;

  const AppSelectChip({
    super.key,
    required this.chipBarWidth,
    required this.chipBarHeight,
    required this.chipBarPadding,
    required this.chipBarSpace,
    required this.appChips,
    this.initialSelectedIndexes,
    this.initialSelectedIndex,
    this.onSingleSelectionChanged,
    this.onMultipleSelectionChanged,
    this.multipleSelection = false,
  });
  @override
  State<AppSelectChip> createState() => _AppSelectChipState();
}

class _AppSelectChipState extends State<AppSelectChip> {
  int? selectedChipIndex;
  List<int> selectedChipIndexes = [];

  @override
  void initState() {
    super.initState();
    if (widget.multipleSelection) {
      selectedChipIndexes = widget.initialSelectedIndexes ?? [];
    } else {
      selectedChipIndex = widget.initialSelectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.chipBarSpace,
      children: List<Widget>.generate(widget.appChips.length, (index) {
        bool isSelected = widget.multipleSelection
            ? selectedChipIndexes.contains(index)
            : selectedChipIndex == index;

        return AppChip(
          text: widget.appChips[index].text,
          size: widget.appChips[index].size,
          leftIcon: widget.appChips[index].leftIcon,
          rightIcon: widget.appChips[index].rightIcon,
          isSelected: isSelected,
          onPressed: () {
            setState(() {
              if (widget.multipleSelection) {
                _handleMultipleSelection(index);
              } else {
                _handleSingleSelection(index);
              }
            });
          },
        );
      }),
    );
  }

  void _handleSingleSelection(int index) {
    if (selectedChipIndex != index) {
      selectedChipIndex = index;
    } else {
      selectedChipIndex = null;
    }
    widget.onSingleSelectionChanged?.call(selectedChipIndex!);
  }

  void _handleMultipleSelection(int index) {
    if (selectedChipIndexes.contains(index)) {
      selectedChipIndexes.remove(index);
    } else {
      selectedChipIndexes.add(index);
    }
    widget.onMultipleSelectionChanged?.call(selectedChipIndexes);
  }
}

TextStyle _getTextStyle(AppChipSize size, bool isSelected) {
  TextStyle baseStyle;

  switch (size) {
    case AppChipSize.medium:
      baseStyle = AppTextStyles.captionNormalSemibold;
    case AppChipSize.large:
      baseStyle = AppTextStyles.labelNormalSemibold;
  }

  return baseStyle.copyWith(
    color: isSelected ? AppColors.white : AppColors.secondaryBlue600,
  );
}
