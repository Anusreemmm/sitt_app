
import 'package:flutter/material.dart';
import 'package:sitt_app/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String selectedLanguage = 'English';
  String selectedCountry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(20),
                selectedColor: Colors.white,
                fillColor: Colors.black,
                color: Colors.black,
                isSelected: [selectedLanguage == 'English', selectedLanguage == 'Arabic'],
                onPressed: (int index) {
                  setState(() {
                    selectedLanguage = index == 0 ? 'English' : 'Arabic';
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('English'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('عربي'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Please select a country',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: countryCard('United Arab Emirates', 'asset/united_.png'),
                      ),
                      Expanded(
                        child: countryCard('Saudi Arabia', 'asset/saudi_.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Please note that our range of services varies by country.',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => home()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Continue'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget countryCard(String country, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCountry = country;
        });
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selectedCountry == country ? Colors.grey.shade200 : Colors.white,
          border: Border.all(color: selectedCountry == country ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 50, width: 50),
            const SizedBox(height: 8),
            Text(country),
          ],
        ),
      ),
    );
  }
}
