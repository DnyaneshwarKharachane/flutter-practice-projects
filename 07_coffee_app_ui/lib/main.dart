import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IcedMochaPage(),
  ));
}

class IcedMochaPage extends StatelessWidget {
  const IcedMochaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFE6),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFA2612B),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.white),
                        Icon(Icons.favorite_border, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/image.png', 
                    height: 500,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Iced Mocha',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2C23),
                  ),
                ),
                Text(
                  '₹150.00',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2C23),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Cup Size
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cup Size',
                style: TextStyle(
                   fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3C2C23),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _sizeButton('Small', false),
                const SizedBox(width: 20),
                _sizeButton('Medium', true),
                const SizedBox(width: 20),
                _sizeButton('Large', false),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Description',
                style: TextStyle(
                   fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and industry. Lorem Ipsum has been the industry\'s standard dummy 1500s, print and typesetting industry.',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 36, 34, 33),
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '280 Cal.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C2C23),
                    fontSize: 26,
                  ),
                ),
                Row(
                  children: [
                    _qtyButton(Icons.remove),
                    const SizedBox(width: 10),
                    const Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C2C23),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _qtyButton(Icons.add),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C2C23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sizeButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3C2C23) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3C2C23)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF3C2C23),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget _qtyButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3C2C23)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 18,
        color: const Color(0xFF3C2C23),
      ),
    );
  }
}
