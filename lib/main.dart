import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const MyQuranApp());
}

class MyQuranApp extends StatelessWidget {
  const MyQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Quran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Amiri',
        scaffoldBackgroundColor: const Color(0xFFF6F9FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0F7FA),
          foregroundColor: Color(0xFF00695C),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00695C),
            letterSpacing: 1.1,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00695C), // Warna utama Islamik
          secondary: const Color(0xFFB2DFDB),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
