import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Map> movieList = [
    {
      "category": "Drama",
      "poster1": "https://media.themoviedb.org/t/p/w600_and_h900_bestv2/eebUPRI4Z5e1Z7Hev4JZAwMIFkX.jpg",
      "poster2": "https://upload.wikimedia.org/wikipedia/en/7/78/Kaakan-Marathi-Movie-Poster.jpg",
      "poster3": "https://image.tmdb.org/t/p/original/z18DWXBRxn3kz00sIVhC7ZK39Qm.jpg",
    },
    {
      "category": "Actions",
      "poster1": "https://static1.tribute.ca/poster/660x980/shadow-and-bone-netflix-152483.jpg",
      "poster2": "https://i.pinimg.com/originals/71/0f/f2/710ff2d98ca34e0f4a27eb7a2d5c0598.jpg",
      "poster3": "https://static1.srcdn.com/wordpress/wp-content/uploads/2024/11/en-us_carryon_main_badguyprofile_vertical_27x40_rgb_pre.jpg",
    },
    {
      "category": "Horror",
      "poster1": "https://static1.srcdn.com/wordpress/wp-content/uploads/2024/03/damsel-netflix-movie-poster.jpg",
      "poster2": "https://i.redd.it/unanxh1e1mp91.jpg",
      "poster3": "https://th.bing.com/th/id/R.19d5597db2e71ec5a78306ce0f62ff8b?rik=0TGy6P3AgkyeGA&riu=http%3a%2f%2fcdn.collider.com%2fwp-content%2fuploads%2f2016%2f06%2fstranger-things-poster-netflix.jpg&ehk=pkncno4Qi9FsZOXXG0hpSnL%2flP%2bBpORZH%2bcSSzgLJEU%3d&risl=&pid=ImgRaw&r=0",
    },
    {
      "category": "Sci-Fi",
      "poster1": "https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQThsB03pbw5vcIx6r3G-Q6BbJ0lp8ukajvWye5b7b38B-5fwKu6dcbPm5vohzOwS_HFF2L0AcdvR43I6bwtDGNH1eYU70dv4wEdVdelqy5lik5krQgmAtCBuK9o4vau57QBFfFUPLy2Tvfyq2CMuLtmu.jpg?r=4bf",
      "poster2": "https://collider.com/wp-content/uploads/2019/04/thriller-netflix-movie-poster.png",
      "poster3": "https://www.indiewire.com/wp-content/uploads/2017/09/imperial-dreams-2014.jpg?w=426",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix App",
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://www.pngarts.com/files/1/Netflix-Logo-PNG-Transparent-Image.png',
                  width: 40,
                ),
                Text("Series", style: TextStyle(color: Colors.white)),
                Text("Peliculas", style: TextStyle(color: Colors.white)),
                Text("Mi lista", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://wallpapercave.com/wp/wp6319888.jpg',
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Text(
                          'Chhichhore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: 160,
                          height: 2,
                          color: Colors.red,
                        ),
                        SizedBox(height: 1),
                        Text(
                          'Comedy | Friendship | College Life | Motivation',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                Text("Mi lista", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.play_arrow, color: Colors.black),
                              label: Text("Reproducir", style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Icon(Icons.info_outline, color: Colors.white),
                                Text("Información", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Movie Sections with Padding start here
              ...List.generate(movieList.length, (index) {
                final movie = movieList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        movie['category'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 230,
                            margin: EdgeInsets.only(right: 15),
                            child: Image.network(movie['poster1']),
                          ),
                          SizedBox(
                            width: 150,
                            height: 230,
                            child: Image.network(movie['poster2']),
                          ),
                          Container(
                            width: 150,
                            height: 230,
                            margin: EdgeInsets.only(left: 15),
                            child: Image.network(movie['poster3']),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
