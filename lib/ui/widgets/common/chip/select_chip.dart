import 'package:BabBBu/ui/widgets/common/chip/chip.dart';
import 'package:flutter/material.dart';

class AppSelectChip extends StatefulWidget {
  final double chipBarWidth, chipBarHeight, chipBarPadding, chipBarSpace;
  final List<AppChip> appChips;
  final bool multipleSelection;
  // 단수 선택 옵션
  final int? initialSelectedIndex; // 선택된 인덱스
  final ValueChanged<int>? onSingleSelectionChanged; // 콜백함수
  // 복수 선택 옵션
  final List<int>? initialSelectedIndexes; // 선택된 인덱스 리스트
  final ValueChanged<List<int>>? onMultipleSelectionChanged; // 콜백함수

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
          properties: widget.appChips[index].properties,
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
