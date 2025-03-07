import 'package:flutter/material.dart';

class botnav extends StatefulWidget {
  const botnav({Key? key}) : super(key: key);

  @override
  State<botnav> createState() => _botnavState();
}

class _botnavState extends State<botnav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.black, 
      unselectedItemColor: Colors.black, 
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          if (_currentIndex == 0) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
          } else if (_currentIndex == 1) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/services');
          } else if (_currentIndex == 2) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/my_bookings');
          } else if (_currentIndex == 3) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/profile');
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Services',
          icon: Icon(Icons.medical_services_sharp),
        ),
        BottomNavigationBarItem(
          label: 'My Bookings',
          icon: Icon(Icons.calendar_today),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person_2_outlined),
        ),
      ],
    );
  }
}
