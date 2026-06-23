import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

/// 写真撮影と永続化を担うサービス
class PhotoService {
  static final ImagePicker _picker = ImagePicker();

  /// カメラを起動して写真を撮影し、アプリ内ストレージに永続保存する。
  /// 成功時は保存先パスを返し、キャンセル時や失敗時は null を返す。
  static Future<String?> takeAndSavePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );
    if (photo == null) return null;

    final dir = await getApplicationDocumentsDirectory();
    final fileName = 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedPath = p.join(dir.path, fileName);
    await File(photo.path).copy(savedPath);
    return savedPath;
  }
}
