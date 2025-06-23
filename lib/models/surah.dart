class Surah {
  final int number;
  final String name;
  final String translation;

  Surah({required this.number, required this.name, required this.translation});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'] ?? 0,
      name: json['name']?['transliteration']?['id'] ?? '',
      translation: json['name']?['translation']?['id'] ?? '',
    );
  }
}
