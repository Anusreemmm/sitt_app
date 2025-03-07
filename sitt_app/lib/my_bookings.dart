import 'package:flutter/material.dart';

class my_bookings extends StatefulWidget {
  @override
  _my_bookingsState createState() => _my_bookingsState();
}

class _my_bookingsState extends State<my_bookings> {
  bool isUpcoming = true;

  List<Map<String, dynamic>> upcomingBookings = [
    {'id': '#2312', 'time': 'Feb 10 - 11:40pm', 'services': ['Home visit doctor, nursing assistant'], 'price': '575'},
    {'id': '#2316', 'time': 'Feb 10 - 11:40pm', 'services': ['Home visit doctor, nursing assistant', 'Annual subscription, two visits per month (nurse)'], 'price': '1,500'},
  ];

  List<Map<String, dynamic>> pastBookings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'My Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('My Bookings', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isUpcoming = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isUpcoming ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        color: isUpcoming ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isUpcoming = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: !isUpcoming ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Past',
                      style: TextStyle(
                        color: !isUpcoming ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: (isUpcoming ? upcomingBookings : pastBookings).isEmpty
                ? const Center(
                    child: Text(
                      'No Data Available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView(
                    children: (isUpcoming ? upcomingBookings : pastBookings)
                        .map((booking) => bookingCard(
                              booking['id'],
                              booking['time'],
                              List<String>.from(booking['services']),
                              booking['price'],
                              isUpcoming,
                            ))
                        .toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget bookingCard(String bookingId, String time, List<String> services, String price, bool isUpcoming) {
    return Card(
      color: isUpcoming ? Colors.white : Colors.grey[200],
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Booking $bookingId', style: TextStyle(color: isUpcoming ? Colors.black : Colors.grey)),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            ...services.map((service) => Text('• $service', style: const TextStyle(color: Colors.black))).toList(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('$price SAR', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
