import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/utils/loading_overlay.dart';

import '../../../core/app_router.dart';
import '../../../core/server_client.dart';
import '../../bottom_nav/view/bottom_nav_screen.dart';

class AuthProvider extends ChangeNotifier {
  String otpController = '';
  String encodeImage = '';
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
      log("thumbnailImage :: $thumbnailImage");

      if (thumbnailImage != null) {
        encodeImage =
            const Base64Encoder().convert(thumbnailImage!.readAsBytesSync());

        log("encodeImage :: $encodeImage");
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

  TextEditingController nameCntrlr = TextEditingController();
  TextEditingController branchCntrlr = TextEditingController();
  TextEditingController departmnetCntrlr = TextEditingController();
  TextEditingController idCntrlr = TextEditingController();
  TextEditingController phoneCntrlr = TextEditingController();

  Future<void> createUserFn({required BuildContext context}) async {
    if (nameCntrlr.text.isEmpty) {
      toast(context, title: "Name is empty", backgroundColor: Colors.red);
    } else if (branchCntrlr.text.isEmpty) {
      toast(context, title: "branch is empty", backgroundColor: Colors.red);
    } else if (departmnetCntrlr.text.isEmpty) {
      toast(context, title: "department is empty", backgroundColor: Colors.red);
    } else if (idCntrlr.text.isEmpty) {
      toast(context, title: "Id is empty", backgroundColor: Colors.red);
    } else if (phoneCntrlr.text.isEmpty) {
      toast(context,
          title: "Phone number is empty", backgroundColor: Colors.red);
    } else if (selectedGender.isEmpty) {
      toast(context, title: "Gender is empty", backgroundColor: Colors.red);
    } else {
      LoadingOverlay.of(context).show();
      try {
        String? genderCode;

        if (selectedGender == "Male") {
          genderCode = "M";
        } else if (selectedGender == "Fenale") {
          genderCode = "F";
        } else {
          genderCode = "N";
        }

        List response = await ServerClient.post(
            "http://rashadahmed36334401.pythonanywhere.com/users/",
            data: {
              "full_name": nameCntrlr.text,
              "phone_number": phoneCntrlr.text,
              "hostel": branchCntrlr.text,
              "department": departmnetCntrlr.text,
              "id_number": idCntrlr.text,
              "username": nameCntrlr.text,
              "image": encodeImage,
              "gender": genderCode
            },
            post: true);

        log("slot1111  ::${response.last}");
        log("slot222  ::${response.first}");
        if (response.first >= 200 && response.first < 300) {
          nameCntrlr.clear();
          phoneCntrlr.clear();
          departmnetCntrlr.clear();
          branchCntrlr.clear();
          nameCntrlr.clear();
          selectedGender = '';
          idCntrlr.clear();
          LoadingOverlay.of(context).hide();
          toast(context, title: "Success", backgroundColor: Colors.green);
          Routes.push(screen: UniBikeBottomNav());

          notifyListeners();
        } else {
          LoadingOverlay.of(context).hide();
          throw Exception('Failed to fetch posts');
        }
      } catch (e) {
        LoadingOverlay.of(context).hide();
        notifyListeners();
        throw Exception('Failed to fetch posts');
      }
    }
  }
}
