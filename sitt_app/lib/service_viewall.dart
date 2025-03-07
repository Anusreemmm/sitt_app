import 'package:flutter/material.dart';
import 'package:sitt_app/botnav.dart';
import 'package:sitt_app/service_viewall.dart';
import 'package:sitt_app/home.dart';

class srvice_viewall extends StatefulWidget {
  const srvice_viewall({super.key});

  @override
  State<srvice_viewall> createState() => _srvice_viewallState();
}

class _srvice_viewallState extends State<srvice_viewall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: botnav(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Services',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'asset/service.png',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
