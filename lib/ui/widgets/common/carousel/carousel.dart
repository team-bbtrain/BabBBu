import 'package:BabBBu/ui/widgets/common/carousel/indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final List<Widget>? textBox;

  const AppCarousel({
    super.key,
    required this.imageUrls,
    this.textBox,
  });

  @override
  AppCarouselState createState() => AppCarouselState();
}

class AppCarouselState extends State<AppCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.textBox?[_currentIndex] != null
            ? widget.textBox![_currentIndex]
            : SizedBox(),
        widget.textBox?[_currentIndex] != null
            ? SizedBox(
                height: 26,
              )
            : SizedBox(),
        AppIndicator(
          currentIndex: _currentIndex,
          indicatorCount: widget.imageUrls.length,
          onDotClicked: (index) {
            _controller.animateToPage(index);
          },
        ),
        SizedBox(height: 3),
        CarouselSlider(
          items: widget.imageUrls.map((url) {
            return Center(
              child: Image.asset(url),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 7),
            aspectRatio: 1,
            height: 313,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}