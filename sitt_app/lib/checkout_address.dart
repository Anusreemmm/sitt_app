import 'package:flutter/material.dart';
import 'package:sitt_app/thank.dart';

class address extends StatefulWidget {
  const address({super.key});

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  int selectedIndex = 0; 

  List<Map<String, String>> addresses = [
    {
      "title": "Home",
      "address": "Riyadh, al oud street",
      "phone": "0505543563"
    },
    {
      "title": "Home 2",
      "address": "Riyadh, al oud street",
      "phone": "0505543563"
    },
    {
      "title": "Home 3",
      "address": "Riyadh, al oud street",
      "phone": "0505543563"
    }
  ];

  void selectAddress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Home visit doctor, nursing assistant',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    selectAddress(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addresses[index]["title"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(addresses[index]["address"]!),
                            Text(addresses[index]["phone"]!),
                          ],
                        ),
                        Row(
                          children: [
                            if (isSelected)
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.purple[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Selected",
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: isSelected
                                  ? () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => thank(),
                                      ));
                                    }
                                  : null,
                              child: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton.icon(
            onPressed: () {
              print("Add New Address");
            },
            icon: const Icon(Icons.add),
            label: const Text("Add New Address"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// class book extends StatelessWidget {
//   const book({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Booking Page')),
//       body: const Center(child: Text('Welcome to Booking Page')),
//     );
//   }
// }
