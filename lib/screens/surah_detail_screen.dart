import 'package:flutter/material.dart';
import '../models/ayah.dart';
import '../services/quran_api.dart';

class SurahDetailScreen extends StatelessWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  bool get showBasmalah => surahNumber != 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0F7FA),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF00695C)),
        title: Text(
          surahName,
          style: const TextStyle(
            color: Color(0xFF00695C),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Ayah>>(
        future: QuranApi.fetchSurahDetail(surahNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF00695C)),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text(
                'Gagal memuat ayat.',
                style: TextStyle(color: Colors.black54),
              ),
            );
          }

          final ayats = snapshot.data!;
          if (ayats.isEmpty) {
            return const Center(
              child: Text(
                'Surah ini tidak memiliki ayat.',
                style: TextStyle(color: Colors.black54),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (showBasmalah)
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE0F7FA), Color(0xFFB2DFDB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.auto_awesome_rounded,
                          color: Color(0xFF00695C),
                          size: 24,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            height: 2.2,
                          ),
                        ),
                        SizedBox(height: 12),
                        Icon(
                          Icons.auto_awesome_rounded,
                          color: Color(0xFF00695C),
                          size: 24,
                        ),
                      ],
                    ),
                  ),

                // List Ayat
                ...ayats.map((ayah) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.only(bottom: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 12, top: 6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0F2F1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${ayah.numberInSurah}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00695C),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                ayah.text,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Amiri',
                                  fontWeight: FontWeight.w600,
                                  height: 2.2,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ayah.translation,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Color(0xFF00695C),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
