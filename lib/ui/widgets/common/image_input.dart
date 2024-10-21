import 'dart:io';
import 'package:BabBBu/ui/assets/assets.dart';
import 'package:BabBBu/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function(File?) onImageSelected;

  const ImageInput({
    super.key,
    required this.onImageSelected,
  });

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onImageSelected(_imageFile);
    }
  }

  void _removeImage() {
    setState(() {
      _imageFile = null;
    });
    widget.onImageSelected(null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _imageFile == null ? _pickImage : _removeImage,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.line50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.line200,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _imageFile == null
              ? Center(
                  child: SvgPicture.asset(
                    AppAssets.icons.camera,
                  ),
                )
              : Stack(
                  children: [
                    // 이미지에 명암을 적용
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        AppColors.text400.withOpacity(0.4),
                        BlendMode.darken,
                      ),
                      child: Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        AppAssets.icons.closeFilled,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
