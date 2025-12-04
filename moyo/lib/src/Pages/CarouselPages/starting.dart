import 'package:flutter/material.dart';
import '../../Screens/home.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
