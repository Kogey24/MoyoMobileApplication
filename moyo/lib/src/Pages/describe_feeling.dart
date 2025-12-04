import 'package:flutter/material.dart';

class DescribeFeeling extends StatelessWidget {
  DescribeFeeling({super.key});

  final TextEditingController _feelingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     leading: Builder(
      //       builder: (context) {
      //         return Icon(Icons.arrow_back);
      //       },
      //     ),
      //     backgroundColor: Color.fromARGB(255, 19, 78, 94),
      //   ),
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                "Describe Your Feeling",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _feelingcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Describe your feeling',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.fromLTRB(50, 05, 50, 5),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    debugPrint(" ${_feelingcontroller.text}");
                  },
                  child: Text(
                    "Match My Feeling",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
