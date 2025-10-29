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
  List<String> imageList = [
    "data:image/jpeg;base64,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",
    "https://documents.iplt20.com/ipl/IPLHeadshot2025/46.png",
    "https://documents.iplt20.com/ipl/IPLHeadshot2025/138.png",
  ];
  Map<String,String> obj = {"name":"MSD","age":"48"};
  int currentIndex = 0;
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imageList[currentIndex],
                height: 200,
                width: 200
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (currentIndex < imageList.length - 1){
                    currentIndex++;
                  } else {
                    currentIndex = 0;
                  }
                  setState(() {});
                },
                child: Text(
                  "Next",
                  style: 
                  TextStyle(fontSize: 30)
                ),
              ),
              SizedBox(height:30),
              Text(
                "Name: ${obj['name']}",
                style: TextStyle(fontSize: 30)
              ),

              // SizedBox(height: 10),
              // Text(
              //   "Age: ${obj['age']}",
              //   style: TextStyle(fontSize: 30)
              //),
            ],
          ),
        ),
      ),
    );
  }
}