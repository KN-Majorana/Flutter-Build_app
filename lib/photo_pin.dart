import 'package:latlong2/latlong.dart';

/// 撮影した写真とその位置情報を保持するモデル
class PhotoPin {
  final String imagePath;
  final LatLng position;
  final DateTime takenAt;

  const PhotoPin({
    required this.imagePath,
    required this.position,
    required this.takenAt,
  });
}
