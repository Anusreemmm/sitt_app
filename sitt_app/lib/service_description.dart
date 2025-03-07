import 'package:flutter/material.dart';

class service_des extends StatefulWidget {
  const service_des({super.key});

  @override
  _service_desState createState() => _service_desState();
}

class _service_desState extends State<service_des> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home Visit Doctors, nursing assistant',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Home Visit Doctor service provides comprehensive, patient-centered medical care in the comfort of your home. By offering personalized consultations and treatments in a familiar setting, we aim to reduce the stress and inconvenience often associated with hospital or clinic visits.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Key Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildFeature(
                '1. Professional Assessment',
                'A licensed physician conducts a thorough examination and reviews your medical history to ensure accurate diagnosis.',
              ),
              _buildFeature(
                '2. Convenient Scheduling',
                'Appointments are flexible to suit your availability, reducing waiting times and travel concerns.',
              ),
              _buildFeature(
                '3. Diagnostic Services',
                'Basic diagnostic tests (such as blood pressure checks, blood sugar tests, and simple lab work) can be performed on-site when needed.',
              ),
              _buildFeature(
                '4. Treatment & Prescriptions',
                'From routine follow-ups to acute care, our doctor can provide tailored treatment plans and prescription medications.',
              ),
              _buildFeature(
                '5. Referrals & Coordination',
                'If specialized care is necessary, our team will coordinate with relevant specialists or hospitals to streamline your healthcare journey.',
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFeature(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}