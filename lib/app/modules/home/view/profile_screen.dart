import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/helpers/common_widget.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/auth/vieww%20model/auth_provider.dart';
import 'package:uni_bike/app/modules/home/view%20model/home_provider.dart';
import 'package:uni_bike/app/utils/extensions.dart';

import '../../../utils/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getProfileFn(ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.black,
      resizeToAvoidBottomInset: false,
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) => Container(
          height: Responsive.height * 100,
          width: Responsive.width * 100,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizeBoxH(80),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: provider.thumbnailImage == null
                    ? Image.asset(
                        "assets/images/cameraIcon.png",
                        width: Responsive.width * 25,
                        height: Responsive.height * 13,
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        const Base64Decoder().convert(provider.encodeImage),
                        fit: BoxFit.cover,
                        width: Responsive.width * 25,
                        height: Responsive.height * 13,
                      ),
              ),
              const SizeBoxH(30),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Full name",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.nameCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "phone number",
                keyboardType: TextInputType.phone,
                maxLength: 10,
                readOnly: true,
                textInputAction: TextInputAction.next,
                controller: provider.phoneCntrlr,
              ),
              const SizeBoxH(10),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Departments",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.departmnetCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "Hostel Name",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.branchCntrlr,
              ),
              const SizeBoxH(10),
              CommonTextFormField(
                bgColor: AppConstants.drawerBgColor,
                hintText: "College Id",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: provider.idCntrlr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
