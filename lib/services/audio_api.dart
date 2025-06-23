import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah_audio.dart';

class AudioApi {
  static Future<List<SurahAudio>> fetchAllSurahAudio() async {
    final response = await http.get(Uri.parse('https://equran.id/api/surat'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => SurahAudio.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data audio');
    }
  }
}
