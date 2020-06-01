import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final picker = ImagePicker();

  Future<File> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    return File(pickedFile.path);
  }
}
