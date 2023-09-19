import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImagePicker extends ChangeNotifier {
  XFile? _image = null;

  XFile get image => _image!;

  Future getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();

    final pickedFile =
    await picker.pickImage(source: imageSource, imageQuality: 100);
    _image = XFile(pickedFile!.path);
    notifyListeners();
  }
}
