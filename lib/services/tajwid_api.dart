import 'dart:convert';
import 'package:http/http.dart' as http;

class TajwidApi {
  static const String _baseUrl =
      'https://api.quran.foundation/v4/quran/verses/uthmani_tajweed';

  static Future<String> fetchTajwidAyah(int surah, int ayah) async {
    final uri = Uri.parse(
      '$_baseUrl?chapter_number=$surah&verse_key=$surah:$ayah',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final text = jsonData['verses'][0]['text_uthmani_tajweed'];
      return text;
    } else {
      throw Exception('Gagal memuat data tajwid');
    }
  }
}
