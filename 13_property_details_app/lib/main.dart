import 'package:flutter/material.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/Property1.jpg',
      'assets/Property2.jpg',
      'assets/Property3.jpg',
      'assets/Property4.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Property Details"),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: imageList.map((path) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        path,
                        height: 180,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Dream House",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.square_foot, color: Colors.amber),
                SizedBox(width: 4),
                Text("230 m"),
                SizedBox(width: 16),
                Icon(Icons.bed, color: Colors.amber),
                SizedBox(width: 4),
                Text("3 Bedrooms"),
                SizedBox(width: 16),
                Icon(Icons.bathroom, color: Colors.amber),
                SizedBox(width: 4),
                Text("4 Bathrooms"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:AssetImage("assets/Owner.jpg"),

                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Owner", style: TextStyle(color: Colors.grey)),
                      Text(
                        "Dnyaneshwar Kharachane",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
             "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
              "Lorem Ipsum has been the industry's standard dummy text ever since.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text("Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 6),
                Expanded(child: Text("123,vrundavan Property nagar pune Maharastra 411006, ")),

              ],
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$2000/month",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Book Now"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PropertyDetailsPage(),
  ));
}
