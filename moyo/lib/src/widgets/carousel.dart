import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Pages/CarouselPages/description.dart';
import '../Pages/CarouselPages/splash_page.dart';
import '../Pages/CarouselPages/starting.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final List<Widget> carouselItems = [
    SplashPage(),
    DescriptionPage(),
    GetStartedPage(),
  ];

  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return buildCarousel();
  }

  Widget buildCarousel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Carousel
        Expanded(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() => activeIndex = index);
              },
            ),
            items: carouselItems.map((item) {
              return Container(padding: const EdgeInsets.all(30), child: item);
            }).toList(),
          ),
        ),

        // Dot Indicator
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: carouselItems.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.pinkAccent,
              dotColor: Colors.white54,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
            ),
            onDotClicked: (index) => _controller.animateToPage(index),
          ),
        ),
      ],
    );
  }
}
