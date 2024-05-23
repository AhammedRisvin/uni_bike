import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/server_client.dart';
import '../../../core/string_const.dart';
import '../../../helpers/common_widget.dart';
import '../../../utils/enums.dart';
import '../../../utils/loading_overlay.dart';
import '../../create ride/model/get_all-rides_moidel.dart';

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
          StringConst.setUserId(userId: response.last['id']);
          getAllRides(context: context, isFrom: false);

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

  GetAllRidesModel getAllRidesModel = GetAllRidesModel();
  GetAllRidesStatus getAllRidesStatus = GetAllRidesStatus.initial;

  TextEditingController startPointCntrlr = TextEditingController();
  TextEditingController endPointCntrlr = TextEditingController();

  Future<void> getAllRides(
      {required BuildContext context, required bool isFrom}) async {
    if (isFrom) {
      getAllRidesStatus = GetAllRidesStatus.loading;
      try {
        notifyListeners();
        String url = "https://unibikes.onrender.com/get-rides";
        List response = await ServerClient.post(
          url,
          data: {
            "startPoint": startPointCntrlr.text,
            "endPoint": endPointCntrlr.text,
          },
        );
        log("response.first   ::     ${response.first}");
        log("response.last    ::    ${response.last}");
        if (response.first >= 200 && response.first < 300) {
          getAllRidesModel = GetAllRidesModel.fromJson(response.last);
          getAllRidesStatus = GetAllRidesStatus.loaded;
        } else {
          getAllRidesStatus = GetAllRidesStatus.error;
        }
      } catch (e) {
        getAllRidesStatus = GetAllRidesStatus.error;
        debugPrint(e.toString());
      } finally {
        notifyListeners();
      }
    } else {
      if (startPointCntrlr.text.isEmpty || endPointCntrlr.text.isEmpty) {
        toast(context,
            title: "Please fill all fields", backgroundColor: Colors.red);
      } else {
        getAllRidesStatus = GetAllRidesStatus.loading;
        try {
          notifyListeners();
          String url = "https://unibikes.onrender.com/get-rides";
          List response = await ServerClient.post(
            url,
            data: {
              "startPoint": startPointCntrlr.text,
              "endPoint": endPointCntrlr.text,
            },
          );
          log("response.first   ::     ${response.first}");
          log("response.last    ::    ${response.last}");
          if (response.first >= 200 && response.first < 300) {
            getAllRidesModel = GetAllRidesModel.fromJson(response.last);
            getAllRidesStatus = GetAllRidesStatus.loaded;
          } else {
            getAllRidesStatus = GetAllRidesStatus.error;
          }
        } catch (e) {
          getAllRidesStatus = GetAllRidesStatus.error;
          debugPrint(e.toString());
        } finally {
          notifyListeners();
        }
      }
    }
  }

  Future<void> getMyRideFn({
    required BuildContext ctx,
  }) async {
    final id = await StringConst.getUserID();
    log("idddd   ::     $id");
    try {
      notifyListeners();
      String url = "https://unibikes.onrender.com/get-my-rides";
      List response = await ServerClient.post(
        url,
        data: {
          "id": id,
        },
      );
      log("response.first   ::     ${response.first}");
      log("response.last    ::    ${response.last}");
      if (response.first >= 200 && response.first < 300) {
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> getProfileFn({
    required BuildContext ctx,
  }) async {
    final id = await StringConst.getUserID();
    log("idddd   ::     $id");
    try {
      notifyListeners();
      String url = "https://unibikes.onrender.com/get-user";
      List response = await ServerClient.post(
        url,
        data: {
          "id": id,
        },
      );
      log("response.first   ::     ${response.first}");
      log("response.last    ::    ${response.last}");
      if (response.first >= 200 && response.first < 300) {
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      notifyListeners();
    }
  }
}

enum SelectedContainer { all, myRide }
