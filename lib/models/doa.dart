class Doa {
  final String title;
  final String arabic;
  final String latin;
  final String translation;

  Doa({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
  });

  factory Doa.fromJson(Map<String, dynamic> json) {
    return Doa(
      title: json['title'] ?? '',
      arabic: json['arabic'] ?? '',
      latin: json['latin'] ?? '',
      translation: json['translation'] ?? '',
    );
  }
}
