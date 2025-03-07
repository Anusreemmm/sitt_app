// import 'package:flutter/material.dart';
// import 'package:sitt_app/checkout.dart';
// import 'package:sitt_app/service_description.dart';

// class book extends StatefulWidget {
//   const book({super.key});

//   @override
//   _bookState createState() => _bookState();
// }

// class _bookState extends State<book> {
//   int selectedIndex = 0;
//   String? selectedTime;
//   bool showAvailableSlots = true;

//   List<String> timeSlots = [
//     '10:00 AM', '11:00 AM', '11:30 AM', '12:00 PM',
//     '12:30 PM', '01:00 PM', '01:30 PM', '02:00 PM'
//   ];

//   List<String> unavailableSlots = ['11:30 AM', '01:00 PM'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(300.0),
//         child: Stack(
//           children: [
//             Container(
//               height: 260,
//               width: double.infinity,
//               child: Image.asset(
//                 'asset/book_service.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: 40,
//               left: 10,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text('Home visit doctor, nursing assistant',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text('250 SAR',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text('Select Date',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   DateTime date = DateTime.now().add(Duration(days: index));
//                   bool isSelected = index == selectedIndex;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.0),
//                       width: 70,
//                       child: Column(
//                         children: [
//                           Text(
//                             ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'][date.weekday - 1],
//                             style: TextStyle(
//                               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                               color: isSelected ? Colors.black : Colors.grey,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//                             height: 60,
//                             width: 60,
//                             decoration: BoxDecoration(
//                               color: isSelected ? Colors.black : Colors.white,
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.grey.withOpacity(0.3)),
//                             ),
//                             child: Center(
//                               child: Text('${date.day}',
//                                   style: TextStyle(
//                                     color: isSelected ? Colors.white : Colors.grey,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Select Time',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   Row(
//                     children: [
//                       Text('Show available slots only', style: TextStyle(fontSize: 15)),
//                       Switch(
//                         value: showAvailableSlots,
//                         onChanged: (value) {
//                           setState(() {
//                             showAvailableSlots = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Wrap(
//               spacing: 10,
//               children: timeSlots.map((time) {
//                 bool isUnavailable = unavailableSlots.contains(time);
//                 bool isHidden = showAvailableSlots && isUnavailable;
//                 return isHidden
//                     ? SizedBox.shrink()
//                     : GestureDetector(
//                         onTap: isUnavailable
//                             ? null
//                             : () {
//                                 setState(() {
//                                   selectedTime = time;
//                                 });
//                               },
//                         child: Chip(
//                           label: Text(time,
//                               style: TextStyle(
//                                 color: selectedTime == time
//                                     ? Colors.white
//                                     : isUnavailable
//                                         ? Colors.grey
//                                         : Colors.black,
//                               )),
//                           backgroundColor: selectedTime == time
//                               ? Colors.black
//                               : isUnavailable
//                                   ? Colors.grey[300]
//                                   : Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               side: BorderSide(color: Colors.grey)),
//                         ),
//                       );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         side: BorderSide(color: Colors.black),
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.shopping_cart, color: Colors.black),
//                           SizedBox(width: 10),
//                           Text('Add to Cart', style: TextStyle(color: Colors.black)),
//                           Spacer(),
//                           Icon(Icons.arrow_forward, color: Colors.black),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => checkout(),
//                         ));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.calendar_today, color: Colors.white),
//                           SizedBox(width: 10),
//                           Text('Book Service', style: TextStyle(color: Colors.white)),
//                           Spacer(),
//                           Icon(Icons.arrow_forward, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sitt_app/checkout.dart';
import 'package:sitt_app/service_description.dart';
import 'package:sitt_app/cart.dart';
import 'package:sitt_app/thank.dart';

class book extends StatefulWidget {
  const book({super.key});

  @override
  _bookState createState() => _bookState();
}

class _bookState extends State<book> {
  int selectedIndex = 0;
  String? selectedTime;
  bool showAvailableSlots = true;

  List<String> timeSlots = [
    '10:00 AM', '11:00 AM', '11:30 AM', '12:00 PM',
    '12:30 PM', '01:00 PM', '01:30 PM', '02:00 PM'
  ];

  List<String> unavailableSlots = ['11:30 AM', '01:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: Stack(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              child: Image.asset(
                'asset/book_service.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Home visit doctor, nursing assistant',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('250 SAR',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Select Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  DateTime date = DateTime.now().add(Duration(days: index));
                  bool isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 70,
                      child: Column(
                        children: [
                          Text(
                            ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'][date.weekday - 1],
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            ),
                            child: Center(
                              child: Text('${date.day}',
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Time',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Show available slots only', style: TextStyle(fontSize: 15)),
                      Switch(
                        value: showAvailableSlots,
                        onChanged: (value) {
                          setState(() {
                            showAvailableSlots = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              children: timeSlots.map((time) {
                bool isUnavailable = unavailableSlots.contains(time);
                bool isHidden = showAvailableSlots && isUnavailable;
                return isHidden
                    ? SizedBox.shrink()
                    : GestureDetector(
                        onTap: isUnavailable
                            ? null
                            : () {
                                setState(() {
                                  selectedTime = time;
                                });
                              },
                        child: Chip(
                          label: Text(time,
                              style: TextStyle(
                                color: selectedTime == time
                                    ? Colors.white
                                    : isUnavailable
                                        ? Colors.grey
                                        : Colors.black,
                              )),
                          backgroundColor: selectedTime == time
                              ? Colors.black
                              : isUnavailable
                                  ? Colors.grey[300]
                                  : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.grey)),
                        ),
                      );
              }).toList(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => cart(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.black),
                          SizedBox(width: 10),
                          Text('Add to Cart', style: TextStyle(color: Colors.black)),
                          Spacer(),
                          Icon(Icons.arrow_forward, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => thank(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today, color: Colors.white),
                          SizedBox(width: 10),
                          Text('Book Service', style: TextStyle(color: Colors.white)),
                          Spacer(),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
