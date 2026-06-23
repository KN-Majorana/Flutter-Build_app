import 'dart:io';
import 'package:flutter/material.dart';
import 'photo_pin.dart';

/// 撮影した写真をグリッド表示する一覧画面
class PhotoListScreen extends StatelessWidget {
  final List<PhotoPin> photoPins;
  const PhotoListScreen({super.key, required this.photoPins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('撮影した写真'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: photoPins.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 64,
                    color: Colors.black26,
                  ),
                  SizedBox(height: 16),
                  Text('まだ写真がありません', style: TextStyle(color: Colors.black45)),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: photoPins.length,
              itemBuilder: (_, index) {
                final pin = photoPins[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(File(pin.imagePath)),
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(File(pin.imagePath), fit: BoxFit.cover),
                  ),
                );
              },
            ),
    );
  }
}
