import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unscrawl/futures/fetch_page_result.dart';

class PictureManager extends ChangeNotifier {
  late File _image;
  File get image => _image;

  Future<File> getImage(ImageSource imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    final takenImage = File(xFile!.path);
    return takenImage;
  }

  Future<File> cropImage(String imagePath) async {
    CroppedFile? croppedFile1 = await ImageCropper().cropImage(
        sourcePath: imagePath,
        compressQuality: 100,
        compressFormat: ImageCompressFormat.png,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false)
        ]);
    var croppedImage = File(croppedFile1!.path);
    return croppedImage;
  }

  getPicture(ImageSource imageSource, context, String chapterId) async {
    _image = await getImage(imageSource);
    _image = await cropImage(_image.path);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FetchPageResult(
          image: _image,
          chapterId: chapterId,
        ),
      ),
    );
  }
}
