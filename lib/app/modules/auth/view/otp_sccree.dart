import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/utils/app_constants.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../vieww model/auth_provider.dart';
import 'create-profile_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              text: "Please wait..",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              maxLines: 2,
              wordSpacing: 4,
            ),
            SizeBoxH(Responsive.height * 1),
            const commonTextWidget(
              align: TextAlign.center,
              color: AppConstants.subTextGrey,
              text: "sent otp to +91 9747489556",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
            SizeBoxH(Responsive.height * 19),
            SizedBox(
              width: Responsive.width * 100,
              child: const commonTextWidget(
                align: TextAlign.center,
                color: AppConstants.subTextGrey,
                text: "We are automatically sent  a sms to your mobile number",
                fontSize: 14,
                maxLines: 2,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
            SizeBoxH(Responsive.height * 6),
            OTPTextField(
              keyboardType: TextInputType.number,
              outlineBorderRadius: 5,
              otpFieldStyle: OtpFieldStyle(
                borderColor: AppConstants.subTextGrey,
                enabledBorderColor: AppConstants.appPrimaryColor,
                focusBorderColor: AppConstants.appPrimaryColor,
                disabledBorderColor: AppConstants.subTextGrey,
              ),
              length: 4,
              width: Responsive.width * 100,
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              fieldWidth: 55,
              style: const TextStyle(
                fontSize: 17,
                color: AppConstants.white,
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                log("Completed: $pin");
                context.read<AuthProvider>().otpController = pin;
              },
            ),
            SizeBoxH(Responsive.height * 6),
            CommonButton(
              onTap: () {
                Routes.push(screen: const CreateProfileScreen());
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
