import 'package:flutter/material.dart';
import '../models/surah.dart';
import '../services/quran_api.dart';
import 'surah_detail_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late Future<List<Surah>> _futureSurahs;

  @override
  void initState() {
    super.initState();
    _futureSurahs = QuranApi.fetchSurahList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0F7FA),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF00695C)),
        centerTitle: true, // Pusatkan teks judul
        title: const Text(
          'Daftar Surah',
          style: TextStyle(
            color: Color(0xFF00695C),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: FutureBuilder<List<Surah>>(
        future: _futureSurahs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF00695C)),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Gagal memuat data\n${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
            );
          }

          final surahs = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              final surah = surahs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SurahDetailScreen(
                        surahNumber: surah.number,
                        surahName: surah.name,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xFF00695C),
                        child: Text(
                          '${surah.number}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              surah.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00695C),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              surah.translation,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
