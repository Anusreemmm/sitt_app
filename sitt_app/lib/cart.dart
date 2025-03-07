import 'package:flutter/material.dart';
import 'package:sitt_app/checkout.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  List<Map<String, dynamic>> cartItems = [
    {
      'service': 'Home visit doctor, nursing assistant',
      'price': 250,
      'date': 'Saturday 8, 1:30PM'
    },
    {
      'service': 'Home visit doctor, nursing assistant',
      'price': 250,
      'date': 'Saturday 8, 1:30PM'
    },
    {
      'service': 'Home visit doctor, nursing assistant',
      'price': 250,
      'date': 'Saturday 8, 1:30PM'
    },
  ];

  int getTotalPrice() {
    int total = 0;
    for (var item in cartItems) {
      total += (item['price'] as int);
    }
    return total;
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Cart", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(item['service'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(item['date'], style: TextStyle(color: Colors.purple)),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${item['price']} SAR", style: TextStyle(fontWeight: FontWeight.bold)),
                        Spacer(),
                        GestureDetector(
                          onTap: () => removeItem(index),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("${getTotalPrice()} SAR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => checkout(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Checkout", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
