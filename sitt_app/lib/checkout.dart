import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sitt_app/checkout_address.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  bool isCardSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text("Checkout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Riyadh, al oud street\n0505543563"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text("Add New Address", style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 20),
              Text("Payment method", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ListTile(
                leading: Checkbox(
                  value: !isCardSelected,
                  onChanged: (value) {
                    setState(() {
                      isCardSelected = !value!;
                    });
                  },
                ),
                title: Text("Apple Pay"),
              ),
              ListTile(
                leading: Checkbox(
                  value: isCardSelected,
                  onChanged: (value) {
                    setState(() {
                      isCardSelected = value!;
                    });
                  },
                ),
                title: Text("Card Payment"),
              ),
              Divider(),
              ListTile(
                title: Text("Home visit doctor, nursing assistant"),
                subtitle: Text("Saturday 8, 1:30PM", style: TextStyle(color: Colors.purple)),
                trailing: Text("250 SAR"),
              ),
              ListTile(
                title: Text("Annual subscription, two visits per month (nurse)"),
                subtitle: Text("Saturday 8, 2:30PM", style: TextStyle(color: Colors.purple)),
                trailing: Text("250 SAR"),
              ),
              Divider(),
              ListTile(
                title: Text("Subtotal"),
                trailing: Text("500 SAR"),
              ),
              ListTile(
                title: Text("VAT 15%"),
                trailing: Text("75 SAR"),
              ),
              ListTile(
                title: Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text("575 SAR", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => address(),
    ));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    minimumSize: Size(double.infinity, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: Text("Book Now", style: TextStyle(color: Colors.white)),
)

            ],
          ),
        ),
      ),
    );
  }
}


