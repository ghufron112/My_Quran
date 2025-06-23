import 'package:flutter/material.dart';
import 'quran_screen.dart';
import 'doa_screen.dart';
import 'tajwid_screen.dart';
import 'audio_screen.dart';
import 'settings_screen.dart';
import '../models/surah_audio.dart';
import '../services/audio_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<SurahAudio> _audioList = [];
  bool _isLoadingAudio = true;
  bool _hasAudioError = false;

  @override
  void initState() {
    super.initState();
    _loadAudioData();
  }

  Future<void> _loadAudioData() async {
    try {
      final result = await AudioApi.fetchAllSurahAudio();
      setState(() {
        _audioList = result;
        _isLoadingAudio = false;
      });
    } catch (e) {
      setState(() {
        _hasAudioError = true;
        _isLoadingAudio = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      const QuranScreen(),
      const DoaScreen(),
      const TajwidScreen(),
      _isLoadingAudio
          ? const Center(child: CircularProgressIndicator())
          : _hasAudioError
          ? const Center(child: Text('Gagal memuat audio'))
          : AudioScreen(surahAudioList: _audioList),
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00695C),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Qur\'an',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Tajwid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones_rounded),
            label: 'Murattal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
