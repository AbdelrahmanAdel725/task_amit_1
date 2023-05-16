import 'package:flutter/material.dart';
import 'package:untitled_16_may/app_route/app_route.dart';
import 'package:untitled_16_may/screens/login_screen.dart';

void main() {
  runApp(const AppRoute());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
