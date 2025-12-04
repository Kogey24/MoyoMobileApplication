import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moyo/Pages/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Widget> carouselItems = [
    // Page 1
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.favorite, color: Colors.pinkAccent, size: 100),
        const SizedBox(height: 30),
        const Text(
          'Moyo',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Follow your heart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),
        ),
      ],
    ),

    // Page 2
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.self_improvement, size: 100, color: Colors.white),
        SizedBox(height: 30),
        Text(
          'Relieve Stress',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Choose how you feel and let Moyo\nhelp you find calm and balance.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    ),

    // Page 3 (last slide with button)
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.local_activity, size: 100, color: Colors.white),
        const SizedBox(height: 30),
        const Text(
          'Be Spontaneous',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Discover fun and random activities\nbased on your mood.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 40),

        // Get Started Button
        Builder(
          builder: (context) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const Homepage()));
            },
            child: const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 19, 78, 94),
              Color.fromARGB(255, 113, 178, 128),
            ],
          ),
        ),
        child: Column(
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
                  return Container(
                    padding: const EdgeInsets.all(30),
                    child: item,
                  );
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
        ),
      ),
    );
  }
}
