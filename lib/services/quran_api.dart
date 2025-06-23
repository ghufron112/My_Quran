import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah.dart';
import '../models/ayah.dart';

class QuranApi {
  static const String baseUrl = 'https://api.quran.gading.dev';

  // Ambil daftar semua surah
  static Future<List<Surah>> fetchSurahList() async {
    final response = await http.get(Uri.parse('$baseUrl/surah'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List surahs = data['data'];
      return surahs.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat daftar surah');
    }
  }

  // Ambil detail ayat berdasarkan nomor surah
  static Future<List<Ayah>> fetchSurahDetail(int surahNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/surah/$surahNumber'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List ayahs = data['data']['verses'];
      return ayahs.map((json) => Ayah.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat detail surah');
    }
  }
}
