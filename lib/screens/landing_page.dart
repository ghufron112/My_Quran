import 'package:flutter/material.dart';
import 'home_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2DFDB), // Soft turquoise
              Color(0xFFE0F7FA), // Light cyan
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Logo Qur'an
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/logo_quran.png',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // ✅ Judul Aplikasi
            const Text(
              'My Quran',
              style: TextStyle(
                color: Color(0xFF00695C),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 14),

            // ✅ Kutipan Ayat
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '"Sesungguhnya Al-Quran ini memberi petunjuk kepada jalan yang lebih lurus." (QS. Al-Isra: 9)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.5,
                  fontStyle: FontStyle.italic,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
