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
    "https://images.deccanherald.com/deccanherald/import/sites/dh/files/article_images/2020/05/19/348591-1776150988-1375391266.jpg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Rafale_-_RIAT_2009_%283751416421%29.jpg/1200px-Rafale_-_RIAT_2009_%283751416421%29.jpg",
    "https://orbitshub.com/wp-content/uploads/2024/03/from-dreams-to-reality-the-journey-of-ins-arihant.jpg",
    "https://i.wpimg.pl/1280x/filerepo.grupawp.pl/api/v1/display/embed/18d3bbfd-2c58-425f-a19c-ab00f1434f89",
    "https://images.moneycontrol.com/static-mcnews/2017/11/RTR18HRH.jpg?impolicy=website&width=1600&height=900",
    "https://nationalinterest.org/wp-content/uploads/2020/03/efew_0.jpg",
    "https://i0.wp.com/defenceupdate.in/wp-content/uploads/2017/11/tejas-2.jpg?resize=725%2C425",
    "https://swarajya.gumlet.io/swarajya/2023-09/7ca31504-ed16-49eb-9a23-5b6b42e8d78e/llh0alvoznfb1__1_.jpg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true",
    "https://static.theprint.in/wp-content/uploads/2025/02/Pinaka.jpg",
  ];

  List<Map<String, String>> dataList = [
    {"name": "INS Vikrant", "type": "Aircraft Carrier"},
    {"name": "Rafale", "type": "Fighter Jet"},
    {
      "name": "INS Arihant",
      "type": "Nuclear-Powered Ballistic Missile Submarine",
    },
    {"name": "S-400 Triumf", "type": "Air Defence System"},
    {"name": "BrahMos", "type": "Cruise Missile"},
    {"name": "T-90 Bhishma", "type": "Main Battle Tank"},
    {"name": "HAL Tejas", "type": "Light Combat Aircraft"},
    {"name": "AWACS", "type": "Airborne Warning and Control System"},
    {"name": "Pinaka MBRL", "type": "Multi Barrel Rocket Launcher System"},
    {"name": "Anti-Tank Guided Missile", "type": "Guided Missile"},
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Indian Defence Systems"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageList[currentIndex], height: 300, width: 300),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex + 1) % imageList.length;
                  });
                },
                child: Text("Next", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(height: 30),
              Text(
                "Name: ${dataList[currentIndex]['name']}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "Type: ${dataList[currentIndex]['type']}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
