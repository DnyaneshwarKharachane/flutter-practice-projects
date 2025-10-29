//Toggle Container Color App
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  bool isBlue = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Toggle Container"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                color: isBlue ? Colors.blue : Colors.red,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isBlue == true) {
                    isBlue = false;
                  } else {
                    isBlue = true;
                  }
                  setState(() {});
                },
                child:Text("Toggle",style:TextStyle(fontSize:20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
