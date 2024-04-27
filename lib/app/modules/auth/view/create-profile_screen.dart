import 'package:flutter/material.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../utils/app_constants.dart';
import '../../bottom_nav/view/bottom_nav_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      body: Container(
        height: Responsive.height * 100,
        width: Responsive.width * 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizeBoxH(80),
            const CircleAvatar(
              radius: 60,
              child: commonNetworkImage(
                url:
                    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fHww",
                height: 112,
                width: 112,
                radius: 100,
              ),
            ),
            const SizeBoxH(50),
            CommonTextFormField(
              bgColor: AppConstants.drawerBgColor,
              hintText: "Full name",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: TextEditingController(),
            ),
            const SizeBoxH(30),
            CommonTextFormField(
              bgColor: AppConstants.drawerBgColor,
              hintText: "phone number",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: TextEditingController(),
            ),
            const SizeBoxH(30),
            Container(
              width: Responsive.width * 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: AppConstants.appPrimaryColor,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: AppConstants.black,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: AppConstants.appPrimaryColor,
                          ),
                        ),
                      ),
                      SizeBoxV(10),
                      commonTextWidget(
                        color: AppConstants.white,
                        text: "Male",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: AppConstants.appPrimaryColor,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: AppConstants.black,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: AppConstants.black,
                          ),
                        ),
                      ),
                      SizeBoxV(10),
                      commonTextWidget(
                        color: AppConstants.white,
                        text: "Female",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: AppConstants.appPrimaryColor,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: AppConstants.black,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: AppConstants.black,
                          ),
                        ),
                      ),
                      SizeBoxV(10),
                      commonTextWidget(
                        color: AppConstants.white,
                        text: "Others",
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizeBoxH(30),
            CommonTextFormField(
              bgColor: AppConstants.drawerBgColor,
              hintText: "Departments",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: TextEditingController(),
            ),
            const SizeBoxH(30),
            CommonTextFormField(
              bgColor: AppConstants.drawerBgColor,
              hintText: "Hostel Name",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: TextEditingController(),
            ),
            const Spacer(),
            CommonButton(
              onTap: () {
                Routes.push(screen: UniBikeBottomNav());
              },
              text: "Submit",
              width: Responsive.width * 100,
              height: Responsive.height * 6,
            ),
            const SizeBoxH(30)
          ],
        ),
      ),
    );
  }
}
