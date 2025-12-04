import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
