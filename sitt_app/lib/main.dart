import 'package:flutter/material.dart';
import 'package:sitt_app/book_service.dart';
import 'package:sitt_app/cart.dart';
import 'package:sitt_app/home.dart';
import 'package:sitt_app/my_bookings.dart';
import 'package:sitt_app/service_description.dart';
import 'package:sitt_app/services.dart';
import 'package:sitt_app/thank.dart';
import 'package:sitt_app/welcome_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Welcome(),
      '/home':(context) => home(),
      '/services':(context) => services(),
    },
  ));
}
