import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/doa.dart';

class DoaApi {
  static const String _baseUrl =
      'https://islamic-api-zhirrr.vercel.app/api/doaharian';

  static Future<List<Doa>> fetchDoaList() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Doa.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data doa');
    }
  }
}
