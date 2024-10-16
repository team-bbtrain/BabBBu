import 'package:BabBBu/ui/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:BabBBu/ui/widgets/text_field/text_field_height.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double height;
  final Function(String)? onSearch;

  const SearchTextField({
    Key? key,
    required this.controller,
    this.hintText = '장소, 지역명으로 검색하세요',
    this.height = TextFieldHeight.lg,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          prefixIcon: SvgPicture.asset(
            AppAssets.icons.searchLine,
            width: 24.0,
            height: 24.0,
            fit: BoxFit.none, // for width, height
          ),
        ),
        onFieldSubmitted: (query) {
          if (onSearch != null) {
            onSearch!(query);
          }
        },
      ),
    );
  }
}
