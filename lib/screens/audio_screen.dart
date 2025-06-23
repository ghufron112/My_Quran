import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/surah_audio.dart';

class AudioScreen extends StatefulWidget {
  final List<SurahAudio> surahAudioList;

  const AudioScreen({super.key, required this.surahAudioList});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  int? _playingSurahId;
  bool _isLoading = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _playingSurahId = null;
        _currentPosition = Duration.zero;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  Future<void> _togglePlay(SurahAudio surah) async {
    setState(() {
      _isLoading = true;
      _playingSurahId = surah.number;
    });

    try {
      if (_isPlaying && _playingSurahId == surah.number) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(UrlSource(surah.audioUrl));
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memutar audio: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildProgressBar() {
    if (_totalDuration.inSeconds == 0) return const SizedBox.shrink();

    double progress =
        _currentPosition.inMilliseconds / _totalDuration.inMilliseconds;

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: LinearProgressIndicator(
        value: progress,
        color: const Color(0xFF00695C),
        backgroundColor: const Color(0xFFE0F2F1),
        minHeight: 4,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final surahs = widget.surahAudioList;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0F7FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Murottal Al-Qur\'an',
          style: TextStyle(
            color: Color(0xFF00695C),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];
          final isCurrent = _playingSurahId == surah.number;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: isCurrent
                  ? const LinearGradient(
                      colors: [Color(0xFFB2DFDB), Color(0xFFE0F2F1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(colors: [Colors.white, Colors.white]),
              boxShadow: [
                BoxShadow(
                  color: isCurrent
                      ? Colors.green.withOpacity(0.25)
                      : Colors.black.withOpacity(0.05),
                  blurRadius: isCurrent ? 10 : 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: const Color(0xFF00695C),
                      child: Text(
                        '${surah.number}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surah.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00695C),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${surah.translation} • ${surah.revelation}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _isLoading && isCurrent
                        ? const SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Color(0xFF00695C),
                            ),
                          )
                        : IconButton(
                            icon: Icon(
                              isCurrent && _isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              size: 38,
                              color: const Color(0xFF00695C),
                            ),
                            onPressed: () => _togglePlay(surah),
                          ),
                  ],
                ),
                if (isCurrent) _buildProgressBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
