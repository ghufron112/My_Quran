import 'package:flutter/material.dart';
import '../models/surah.dart';
import '../screens/surah_detail_screen.dart';

class SurahCard extends StatelessWidget {
  final Surah surah;

  const SurahCard({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke detail surah
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailScreen(
              surahNumber: surah.number,
              surahName: surah.name,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Nomor Surah
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF0083B0),
              child: Text(
                surah.number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Nama Surah & Arti
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surah.translation,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Icon Arah
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
