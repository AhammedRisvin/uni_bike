import 'package:flutter/material.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/utils/app_constants.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import 'otp_sccree.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      appBar: AppBar(
        backgroundColor: AppConstants.black,
        leading: IconButton(
          onPressed: () => Routes.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppConstants.white,
            size: 18,
          ),
        ),
      ),
      body: Container(
        height: Responsive.height * 100,
        width: Responsive.width * 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizeBoxH(40),
            const commonTextWidget(
              color: AppConstants.white,
              align: TextAlign.start,
              text: "Enter Your Phone Number",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              maxLines: 2,
              wordSpacing: 4,
            ),
            SizeBoxH(Responsive.height * 15),
            CommonTextFormField(
              bgColor: AppConstants.drawerBgColor,
              hintText: "phone number",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: TextEditingController(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10),
              child: commonTextWidget(
                color: AppConstants.subTextGrey,
                text: "We will send you an otp",
                fontSize: 12,
              ),
            ),
            SizeBoxH(Responsive.height * 5),
            CommonButton(
              onTap: () {
                Routes.push(
                  screen: const OtpScreen(),
                );
              },
              text: "Continue",
              width: Responsive.width * 100,
              height: Responsive.height * 6,
            )
          ],
        ),
      ),
    );
  }
}
