import 'package:flutter/material.dart';
import '../models/doa.dart';
import '../services/doa_api.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({super.key});

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  late Future<List<Doa>> _futureDoa;

  @override
  void initState() {
    super.initState();
    _futureDoa = DoaApi.fetchDoaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        title: const Text('Doa Harian'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE0F7FA),
        foregroundColor: const Color(0xFF00695C),
        elevation: 0,
      ),
      body: FutureBuilder<List<Doa>>(
        future: _futureDoa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF00695C)),
            );
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Gagal memuat doa harian.\nPeriksa koneksi Anda.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            );
          }

          final doaList = snapshot.data!;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: doaList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final doa = doaList[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doa.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00695C),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      doa.arabic,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Amiri',
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      doa.latin,
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      doa.translation,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
