import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../services/tajwid_api.dart';
import '../data/tajwid_data.dart';

class TajwidScreen extends StatefulWidget {
  const TajwidScreen({super.key});

  @override
  State<TajwidScreen> createState() => _TajwidScreenState();
}

class _TajwidScreenState extends State<TajwidScreen> {
  final _surahController = TextEditingController();
  final _ayahController = TextEditingController();
  String? _tajwidHtml;
  bool _loading = false;
  String? _error;

  Future<void> _loadTajwid() async {
    final surah = int.tryParse(_surahController.text);
    final ayah = int.tryParse(_ayahController.text);

    if (surah == null || ayah == null) {
      setState(() {
        _error = 'Masukkan nomor surah dan ayat yang valid.';
        _tajwidHtml = null;
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      _tajwidHtml = null;
    });

    try {
      final tajwidText = await TajwidApi.fetchTajwidAyah(surah, ayah);
      setState(() => _tajwidHtml = tajwidText);
    } catch (e) {
      setState(
        () => _error = 'Gagal memuat tajwid. Periksa koneksi & nomor ayat.',
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _surahController.dispose();
    _ayahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        title: const Text('Belajar Tajwid'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE0F7FA),
        foregroundColor: const Color(0xFF00695C),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 🌙 Header dengan ajakan
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.auto_stories_rounded,
                  color: Color(0xFF00695C),
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '✨ Ayo cari tajwid berdasarkan ayat & surah yang kamu ingin pelajari!',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal[800],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 🔍 Input Surah & Ayat
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _surahController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Surah',
                          prefixIcon: const Icon(Icons.menu_book_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _ayahController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Ayat',
                          prefixIcon: const Icon(Icons.format_list_numbered),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _loading ? null : _loadTajwid,
                    icon: const Icon(Icons.search_rounded, color: Colors.white),
                    label: const Text(
                      'Cari Tajwid',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00695C),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 🔄 Loading & Error
          if (_loading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF00695C)),
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),

          // ✅ Tajwid hasil pencarian
          if (_tajwidHtml != null)
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Html(
                data: _tajwidHtml!,
                style: {
                  "body": Style(
                    fontSize: FontSize(22),
                    fontFamily: 'Amiri',
                    textAlign: TextAlign.right,
                    lineHeight: LineHeight.number(2.2),
                    color: Colors.black87,
                  ),
                },
              ),
            ),

          const SizedBox(height: 32),

          // 📘 Materi
          const Text(
            '📚 Materi Lengkap Ilmu Tajwid',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00695C),
            ),
          ),
          const SizedBox(height: 12),

          ...tajwidList.map((tajwid) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.bookmark_rounded,
                        color: Color(0xFF00695C),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tajwid.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00695C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tajwid.description,
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tajwid.examples,
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
