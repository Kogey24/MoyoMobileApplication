import 'package:flutter/material.dart';
import 'package:moyo/src/widgets/carousel.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
        child: CustomCarousel(),
      ),
    );
  }
}
