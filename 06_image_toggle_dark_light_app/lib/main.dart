//Toggle Container Dark light change App
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  bool isBlackBody = true; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme Switcher App"),
          centerTitle: true,
          backgroundColor: Colors.blue, // AppBar color remains blue
        ),
        body: Container( // Wrap the Center widget with a Container
          color: isBlackBody ? const Color.fromARGB(255, 62, 60, 60) : const Color.fromRGBO(232, 222, 222, 1), // Set body background color here
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  child: isBlackBody
                      ? Image.network(
                          "https://cdn-icons-png.flaticon.com/512/5262/5262027.png",
                        )
                      : Image.network(
                          "https://static-00.iconduck.com/assets.00/mode-light-icon-512x512-yuubs6qt.png",
                        ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isBlackBody = !isBlackBody; // Toggle the body background color
                    });
                  },
                  child: Text(
                   isBlackBody ? "Switch to Light Mode" : "Switch to Dark Mode",
                  style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}