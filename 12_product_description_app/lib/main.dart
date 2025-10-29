import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShoeDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({super.key});

  final int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shoes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart, color: Colors.deepPurple),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shoe image
            Image.asset('assets/img.jpg', fit: BoxFit.cover),

            // Title
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Nike Air Force 1 "07',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            // Tags
            Row(
              children: [
                _buildTag('Shoes'),
                _buildTag('Footwear'),
              ],
            ),

            // Description
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'With iconic style and legendary comfort, the AF-1 was made to be worn on repeat. '
                'This iteration puts a fresh spin on the hoops classic with crisp leather, '
                '80s construction and reflective-design Swoosh logos.',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Quantity section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('Quantity', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: null,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('$quantity'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: null,
                  ),
                ],
              ),
            ),

            // Purchase button
            Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Purchased $quantity item(s)!'),
                      ),
                    );
                  },
                  child: const Text(
                    'PURCHASE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tag builder
  static Widget _buildTag(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
