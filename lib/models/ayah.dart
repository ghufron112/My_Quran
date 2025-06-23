class Ayah {
  final int numberInSurah;
  final String text;
  final String translation;

  Ayah({
    required this.numberInSurah,
    required this.text,
    required this.translation,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      numberInSurah: json['number']['inSurah'],
      text: json['text']['arab'],
      translation: json['translation']['id'],
    );
  }
}
