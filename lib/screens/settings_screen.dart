import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });

    // TODO: Simpan preferensi tema jika ingin
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE0F7FA),
        foregroundColor: const Color(0xFF00695C),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildThemeToggleCard(),
          const SizedBox(height: 12),
          _buildCardTile(
            icon: Icons.menu_book_rounded,
            title: 'Pengaturan Al-Qur\'an',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _buildCardTile(
            icon: Icons.privacy_tip_rounded,
            title: 'Kebijakan Privasi',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _buildCardTile(
            icon: Icons.info_outline_rounded,
            title: 'Informasi Data',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _buildCardTile(
            icon: Icons.share_rounded,
            title: 'Bagikan Aplikasi',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _buildCardTile(
            icon: Icons.info_rounded,
            title: 'Tentang Aplikasi',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggleCard() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _toggleTheme(!isDarkMode),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: Row(
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: isDarkMode ? Colors.orange : const Color(0xFF00695C),
                size: 26,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Tema ${isDarkMode ? 'Gelap' : 'Terang'}',
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: isDarkMode
                    ? const Icon(
                        Icons.toggle_on_rounded,
                        key: ValueKey('on'),
                        size: 40,
                        color: Colors.orange,
                      )
                    : const Icon(
                        Icons.toggle_off_rounded,
                        key: ValueKey('off'),
                        size: 40,
                        color: Colors.grey,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF00695C), size: 26),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
