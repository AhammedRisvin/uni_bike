import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_bike/app/core/app_router.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/modules/home/view%20model/home_provider.dart';
import 'package:uni_bike/app/utils/app_constants.dart';

import '../../../helpers/common_widget.dart';
import '../../../utils/extensions.dart';
import '../widget/active_rides_container.dart';
import 'my_ride_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: AppConstants.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Image.asset(
            "assets/images/logoGif.gif",
            height: 80,
            width: 200,
            fit: BoxFit.cover,
          ),
          backgroundColor: AppConstants.black,
          toolbarHeight: 100,
          bottom: provider.isFilterShow
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Responsive.width * 40,
                              child: CommonTextFormField(
                                bgColor: AppConstants.teleContainerBg,
                                hintText: "from",
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                controller: TextEditingController(),
                                radius1: 15,
                                radius2: 15,
                              ),
                            ),
                            SizedBox(
                              width: Responsive.width * 40,
                              child: CommonTextFormField(
                                bgColor: AppConstants.teleContainerBg,
                                hintText: "to",
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                controller: TextEditingController(),
                                radius1: 15,
                                radius2: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizeBoxH(10),
                        CommonBannerButtonWidget(
                          bgColor: AppConstants.transparent,
                          text: "Filter",
                          borderColor: AppConstants.appPrimaryColor,
                          textColor: AppConstants.appPrimaryColor,
                          width: Responsive.width * 30,
                          height: Responsive.height * 4,
                        ),
                        const SizeBoxH(10),
                      ],
                    ),
                  ),
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(0), child: Container()),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizeBoxH(10),
              SizedBox(
                width: Responsive.width * 100,
                child: Row(
                  children: [
                    const SizeBoxV(15),
                    CommonBannerButtonWidget(
                      text: "All",
                      borderColor: Colors.transparent,
                      bgColor:
                          provider.selectedContainer == SelectedContainer.all
                              ? AppConstants.appPrimaryColor
                              : AppConstants.transparent,
                      textColor:
                          provider.selectedContainer == SelectedContainer.all
                              ? AppConstants.black
                              : AppConstants.subTextGrey,
                      fontSize: 12,
                      width: 90,
                      onTap: () {
                        // context.read<HomeProvider>().getEventFn(
                        //       filter: "",
                        //       pageNo: "",
                        //       searchKeyword: "",
                        //     );
                        provider.removeFilter();
                        Provider.of<HomeProvider>(context, listen: false)
                            .updateSelectedContainer(SelectedContainer.all);
                      },
                    ),
                    const SizeBoxV(15),
                    CommonBannerButtonWidget(
                      text: "My Ride",
                      borderColor: Colors.transparent,
                      bgColor:
                          provider.selectedContainer == SelectedContainer.myRide
                              ? AppConstants.appPrimaryColor
                              : AppConstants.transparent,
                      textColor:
                          provider.selectedContainer == SelectedContainer.myRide
                              ? AppConstants.black
                              : AppConstants.subTextGrey,
                      fontSize: 12,
                      width: 90,
                      onTap: () {
                        // context.read<HomeProvider>().getEventFn(
                        //       filter: "ending",
                        //       pageNo: "",
                        //       searchKeyword: "",
                        //     );
                        provider.removeFilter();
                        Provider.of<HomeProvider>(context, listen: false)
                            .updateSelectedContainer(SelectedContainer.myRide);
                      },
                    ),
                    const SizeBoxV(15),
                  ],
                ),
              ),
              SizeBoxH(Responsive.height * 2),
              provider.selectedContainer == SelectedContainer.myRide
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CommonInkwell(
                            onTap: () {
                              Routes.push(screen: const MyRideDetailsScreen());
                            },
                            child: const ActiveRidesContainer(
                              isFromMyRide: true,
                            ));
                      },
                      separatorBuilder: (context, index) => const SizeBoxH(20),
                      itemCount: 1,
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CommonInkwell(
                          onTap: () {},
                          child: const ActiveRidesContainer(
                            isFromMyRide: false,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizeBoxH(20),
                      itemCount: 10,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonBannerButtonWidget extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final String text;
  final double fontSize;
  final void Function()? onTap;
  final double height;
  final double radius;
  const CommonBannerButtonWidget(
      {super.key,
      required this.bgColor,
      required this.text,
      required this.borderColor,
      required this.textColor,
      required this.width,
      this.height = 35,
      this.onTap,
      this.radius = 100,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: commonTextWidget(
            color: textColor,
            text: text,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
