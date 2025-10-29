import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;
  int number = 2;

  List<int> tableList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Table: $tableList", style: TextStyle(fontSize: 30)),
              ElevatedButton(
                onPressed: () {
                  int nextNumber = number * currentIndex;
                  tableList.add(nextNumber);
                  currentIndex++;
                  setState(() {});
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
