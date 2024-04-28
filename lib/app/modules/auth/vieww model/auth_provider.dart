import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_router.dart';

class AuthProvider extends ChangeNotifier {
  String otpController = '';

  //PROFILE PICTURE START
  File? thumbnailImage;
  Future changeProfilePhoto(bool isGallery, BuildContext context) async {
    // log("object");
    try {
      final image = await ImagePicker().pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,
      );

      if (image == null) return;
      final imageTemporary = File(image.path);
      thumbnailImage = imageTemporary;

      if (thumbnailImage != null) {
        Routes.back();
        // uploadProfileImageToAws();
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  //PROFILE PIC END

  String selectedGender = '';

  void genderSelect(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
}
