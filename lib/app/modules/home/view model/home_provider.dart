import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/app_router.dart';
import '../../../core/server_client.dart';
import '../../../helpers/common_widget.dart';
import '../../../utils/loading_overlay.dart';

class HomeProvider extends ChangeNotifier {
  // selecting between 2 containers start

  SelectedContainer _selectedContainer = SelectedContainer.all;

  SelectedContainer get selectedContainer => _selectedContainer;

  void updateSelectedContainer(SelectedContainer newContainer) {
    _selectedContainer = newContainer;
    notifyListeners();
  }

  bool isFilterShow = true;

  removeFilter() {
    isFilterShow = !isFilterShow;
    log("isFilterShow $isFilterShow");
    notifyListeners();
  }

  // selecting between 2 containers end

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
    } else {
      LoadingOverlay.of(context).show();
      try {
        List response = await ServerClient.post(
            "http://rashadahmed36334401.pythonanywhere.com/rides/",
            data: {
              "motorcycle": nameCntrlr.text,
              "start_point": phoneCntrlr.text,
              "end_point": branchCntrlr.text,
              "start_time": departmnetCntrlr.text,
              "end_time": idCntrlr.text,
              "contact_number": nameCntrlr.text,
              "created_by": "",
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

          idCntrlr.clear();
          LoadingOverlay.of(context).hide();
          toast(context, title: "Success", backgroundColor: Colors.green);
          // Routes.back();

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

enum SelectedContainer { all, myRide }
