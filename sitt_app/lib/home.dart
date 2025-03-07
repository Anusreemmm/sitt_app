import 'package:flutter/material.dart';
import 'package:sitt_app/botnav.dart';
import 'package:sitt_app/service_viewall.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: botnav(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.menu, color: Colors.black),
            SizedBox(width: 10),
            Text('Sitt', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        elevation: 0,
        actions: [
          Icon(Icons.shopping_cart, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('asset/headerr.png', width: double.infinity, height: 100, fit: BoxFit.cover),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext) => srvice_viewall()));
                    },
                    child: Text('View All >', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
              Center(
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('asset/service.png', width: double.infinity, height: 350, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(Icons.feed, color: Colors.green, size: 30),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Do you need help?', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Contact us via WhatsApp Now', style: TextStyle(color: Colors.green)),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: Text('Contact Us'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Packages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext) => home()));
                    },
                    child: Text('View All >', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset('asset/featured.png', width: double.infinity, height: 100, fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Home visit doctor, nursing assistant', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('250', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16)),
                                  Text(' SAR', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
