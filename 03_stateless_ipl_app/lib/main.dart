//IPL Team StatelessWidget
import "package:flutter/material.dart";

void main() {
  runApp(MiTeam());
}

class MiTeam extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(" Mumbai Indians"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 75,
                        width: 110,
                        child: Image.network(
                          
                        "https://upload.wikimedia.org/wikipedia/en/thumb/c/cd/Mumbai_Indians_Logo.svg/345px-Mumbai_Indians_Logo.svg.png",
                        ),
                      ),

                    ],
                  ),
                  SizedBox(width: 20),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          "https://documents.iplt20.com/ipl/IPLHeadshot2025/6.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Rohit Sharma", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          "https://documents.iplt20.com/ipl/IPLHeadshot2025/3103.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Robin Minz", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          "https://documents.iplt20.com/ipl/IPLHeadshot2025/174.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Surya Kumar Yadav", style: TextStyle(fontSize: 15)),
                     
                    ],
                  ),
                ],
              ),
               SizedBox(width: 20),
              


               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          //"https://documents.iplt20.com/ipl/IPLHeadshot2025/6.png",
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/993.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("N.Tilak Varma", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/54.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Hardik Pandya", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          //"https://documents.iplt20.com/ipl/IPLHeadshot2025/174.png",
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/9.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Jasprit Bhumrah", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),

              SizedBox(width: 20),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/3107.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Naman Dhir", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          //"https://documents.iplt20.com/ipl/IPLHeadshot2025/3103.png",
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/1941.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Will Jacks", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        child: Image.network(
                          //"https://documents.iplt20.com/ipl/IPLHeadshot2025/174.png",
                        "https://documents.iplt20.com/ipl/IPLHeadshot2025/3566.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Vignesh Puthur", style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
