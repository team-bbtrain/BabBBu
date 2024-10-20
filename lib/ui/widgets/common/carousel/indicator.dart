import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;
  final Function(int) onDotClicked;

  const AppIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
    required this.onDotClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        bool isSelected = currentIndex == index;

        return GestureDetector(
          onTap: () => onDotClicked(index),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            width: isSelected ? 32.0 : 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryOrange500
                  : AppColors.background200,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        );
      }),
    );
  }
}
