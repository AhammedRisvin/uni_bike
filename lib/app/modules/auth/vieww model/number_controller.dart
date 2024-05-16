import 'package:flutter/material.dart';
import 'package:uni_bike/app/core/server_client.dart';
import 'package:uni_bike/app/core/string_const.dart';

import '../../../core/app_router.dart';
import '../view/create-profile_screen.dart';

class NumberController extends ChangeNotifier {
  bool isLoading = false;
  Future<void> phoneNumberAuth({
    required String numb,
    required BuildContext ctx,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      String url = "https://rashadahmed36334401.pythonanywhere.com/login/";
      List response = await ServerClient.post(
        url,
        data: {"phone": numb},
      );
      if (response.first >= 200 && response.first < 300) {
        await StringConst.addUserToken(userToken: response.last['token']);
        Routes.pushReplace(screen: const CreateProfileScreen());
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Something went wrong! Try again.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
