// lib/models/surah_audio.dart

class SurahAudio {
  final int number;
  final String name;
  final String translation;
  final String revelation;
  final String audioUrl;

  SurahAudio({
    required this.number,
    required this.name,
    required this.translation,
    required this.revelation,
    required this.audioUrl,
  });

  factory SurahAudio.fromJson(Map<String, dynamic> json) {
    return SurahAudio(
      number: json['nomor'],
      name: json['nama_latin'], 
      translation: json['arti'],
      revelation: json['tempat_turun'],
      audioUrl: json['audio'],
    );
  }
}
