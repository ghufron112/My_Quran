import '../models/tajwid.dart';

final List<Tajwid> tajwidList = [
  Tajwid(
    title: 'Pengertian Tajwid',
    description:
        'Tajwid secara bahasa berarti memperindah atau memperbagus. Secara istilah, tajwid adalah ilmu yang mempelajari cara membaca Al-Qur\'an dengan benar sesuai makhraj dan sifat huruf.',
    examples:
        'Contoh: Membaca huruf dengan panjang pendek dan tekanan yang benar.',
  ),
  Tajwid(
    title: 'Hukum Nun Sukun dan Tanwin - Idzhar',
    description:
        'Idzhar artinya jelas. Ketika nun sukun atau tanwin bertemu dengan salah satu huruf idzhar (ء، هـ، ع، ح، غ، خ), maka dibaca jelas.',
    examples: 'Contoh: مِنْهَا، أَنْعَمْتَ، عَلِيمٌ حَكِيمٌ',
  ),
  Tajwid(
    title: 'Hukum Nun Sukun dan Tanwin - Idgham',
    description:
        'Idgham artinya memasukkan. Terjadi jika nun sukun atau tanwin bertemu dengan huruf idgham (ي، ر، م، ل، و، ن). Idgham terbagi dua: Idgham Bighunnah (nasal) dan Bilaghunnah (tanpa nasal).',
    examples: 'Contoh: مَنْ يَقُولُ، خَيْرٌ لَكُمْ، غَفُورٌ رَحِيمٌ',
  ),
  Tajwid(
    title: 'Hukum Nun Sukun dan Tanwin - Iqlab',
    description:
        'Iqlab artinya membalik. Jika nun sukun atau tanwin bertemu dengan huruf ب, maka nun dibaca dengan suara mim disertai dengung.',
    examples: 'Contoh: أَنْبِئْهُمْ، سَمِيعٌ بَصِيرٌ',
  ),
  Tajwid(
    title: 'Hukum Nun Sukun dan Tanwin - Ikhfa',
    description:
        'Ikhfa artinya menyamarkan. Terjadi saat nun sukun atau tanwin bertemu huruf-huruf ikhfa (selain huruf idzhar, idgham, dan iqlab). Dibaca samar disertai dengung.',
    examples: 'Contoh: مَنْفُوسَةٍ، عَذَابٌ أَلِيمٌ',
  ),
  Tajwid(
    title: 'Hukum Mim Sukun - Ikhfa Syafawi',
    description:
        'Jika mim sukun bertemu dengan huruf ب, maka dibaca samar dengan dengung.',
    examples: 'Contoh: تَرْمِيهِمْ بِحِجَارَةٍ',
  ),
  Tajwid(
    title: 'Hukum Mim Sukun - Idgham Mimi',
    description:
        'Jika mim sukun bertemu dengan mim, maka dibaca dengan dengung dan melebur.',
    examples: 'Contoh: لَهُمْ مَغْفِرَةٌ',
  ),
  Tajwid(
    title: 'Hukum Mim Sukun - Idzhar Syafawi',
    description:
        'Jika mim sukun bertemu huruf selain mim dan ba, maka dibaca jelas.',
    examples: 'Contoh: نِعْمَ أَجْرُ الْعَامِلِينَ',
  ),
  Tajwid(
    title: 'Mad Thabi’i',
    description:
        'Mad Thabi’i terjadi ketika ada huruf mad (ا، و، ي) yang tidak diikuti oleh hamzah atau sukun. Dibaca 2 harakat.',
    examples: 'Contoh: قَالَ، يُقِيمُونَ، قِيلَ',
  ),
  Tajwid(
    title: 'Mad Wajib Muttashil',
    description:
        'Mad terjadi karena huruf mad bertemu dengan hamzah dalam satu kata. Dibaca 4–5 harakat.',
    examples: 'Contoh: السَّمَاءُ، جَاءَ',
  ),
  Tajwid(
    title: 'Mad Jaiz Munfashil',
    description:
        'Mad terjadi ketika huruf mad berada di akhir kata dan hamzah di awal kata berikutnya. Dibaca 4–5 harakat.',
    examples: 'Contoh: فِي أَنْفُسِكُمْ، إِنَّا أَعْطَيْنَاكَ',
  ),
  Tajwid(
    title: 'Mad Aridh Lissukun',
    description:
        'Mad terjadi ketika akhir bacaan terdapat huruf mad sebelum huruf yang disukunkan karena waqaf (berhenti). Panjang 2, 4, atau 6 harakat.',
    examples: 'Contoh: نَسْتَعِينُ، نُؤْمِنُ',
  ),
  Tajwid(
    title: 'Qalqalah',
    description:
        'Qalqalah adalah memantulnya suara saat membaca huruf qalqalah (ق، ط، ب، ج، د). Ada 3 tingkat: kecil, sedang, dan besar.',
    examples: 'Contoh: أَحَدٌ، يَطْمَعُ، يَقْتُلُ',
  ),
  Tajwid(
    title: 'Ghunnah',
    description:
        'Ghunnah adalah dengungan suara yang keluar dari hidung saat membaca huruf-huruf seperti nun dan mim bertasydid.',
    examples: 'Contoh: إِنَّ، ثُمَّ، مِمَّا',
  ),
];
