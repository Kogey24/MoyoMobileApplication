import 'package:flutter/material.dart';
import 'package:moyo/src/Screens/describe_feeling.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> moods = [
    {
      "title": "Happy",
      "icon": Icons.sentiment_satisfied,
      "color": Colors.yellow,
    },
    {
      "title": "Sad",
      "icon": Icons.sentiment_dissatisfied,
      "color": Colors.blueAccent,
    },
    {
      "title": "Stressed",
      "icon": Icons.self_improvement,
      "color": Colors.redAccent,
    },
    {
      "title": "Excited",
      "icon": Icons.celebration,
      "color": Colors.orangeAccent,
    },
    {"title": "Lonely", "icon": Icons.person, "color": Colors.purpleAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Moyo ❤️",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 19, 78, 94), // Teal dark
              Color.fromARGB(255, 113, 178, 128), // Teal light
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mood Grid
                const Text(
                  "How do you feel?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: moods.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                    itemBuilder: (context, index) {
                      final mood = moods[index];
                      return GestureDetector(
                        onTap: () {
                          // handle mood selection
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: mood["color"].withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(mood["icon"], color: Colors.white, size: 40),
                              const SizedBox(height: 10),
                              Text(
                                mood["title"],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Quick Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _quickAction(Icons.casino, "Random"),
                    _quickAction(Icons.spa, "Breathe"),
                    _quickAction(Icons.music_note, "Music"),
                  ],
                ),

                const SizedBox(height: 20),

                // Daily Quote / Affirmation
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "✨ 'Your emotions are valid. Take it one step at a time.'",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 80), // spacing for FAB
              ],
            ),
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        icon: const Icon(Icons.favorite),
        label: const Text(
          "How do you feel?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          // navigate to mood survey or suggestions
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => DescribeFeeling()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.2),
          radius: 28,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
