import 'package:flutter/material.dart';
import 'package:myportfolio/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ankit Kandulna | Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFE8F4FD),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1B5E8A),
          secondary: Color(0xFF00D4FF),
          surface: Color(0xFFE8F4FD),
        ),
      ),
      home: const HomePage(),
    );
  }
}