import 'package:flutter/material.dart';

import '../../../helpers/common_widget.dart';
import '../../../helpers/size_box.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions.dart';
import '../view/home_screen.dart';

class ActiveRidesContainer extends StatelessWidget {
  // final EventDatum? eventData;
  final bool isFromMyRide;
  const ActiveRidesContainer({
    super.key,
    this.isFromMyRide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.white54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: AppConstants.drawerBgColor,
          width: 1,
        ),
      ),
      child: Container(
        width: Responsive.width * 100,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppConstants.drawerBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Row(
                children: [
                  commonNetworkImage(
                    url:
                        "https://cdn.dribbble.com/userupload/11926943/file/original-f0aeaf93e5bcacfe266c1df05322b95c.jpg?crop=1051x0-5347x3222&resize=400x300&vertical=center",
                    height: Responsive.height * 10,
                    width: Responsive.width * 25,
                  ),
                  const SizeBoxV(20),
                  Expanded(
                    child: SizedBox(
                      height: Responsive.height * 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const commonTextWidget(
                            color: AppConstants.white,
                            text: "creater name",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/eventClockIcon.png",
                                    height: 12,
                                  ),
                                  const SizeBoxV(5),
                                  const commonTextWidget(
                                    color: AppConstants.white,
                                    text: "10.00 Am",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              const commonTextWidget(
                                color: Color(0xff7D7A43),
                                text: "Upcoming",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonTextWidget(
                                color: AppConstants.white,
                                align: TextAlign.start,
                                maxLines: 1,
                                text: "bike details",
                                overFlow: TextOverflow.ellipsis,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              commonTextWidget(
                                color: AppConstants.white,
                                align: TextAlign.start,
                                maxLines: 1,
                                text: "Male",
                                overFlow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizeBoxH(Responsive.height * 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  commonTextWidget(
                    color: AppConstants.white,
                    align: TextAlign.start,
                    text: "+919747489556",
                    overFlow: TextOverflow.ellipsis,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizeBoxH(Responsive.height * 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/eventLocationIcon.png",
                        height: 12,
                      ),
                      const SizeBoxV(5),
                      const commonTextWidget(
                        color: AppConstants.white,
                        align: TextAlign.start,
                        text: "Ponlait",
                        overFlow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const commonTextWidget(
                    color: AppConstants.appPrimaryColor,
                    align: TextAlign.start,
                    text: "To",
                    overFlow: TextOverflow.ellipsis,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      const commonTextWidget(
                        color: AppConstants.white,
                        text: "Main Gate",
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizeBoxV(5),
                      Image.asset(
                        "assets/images/eventLocationIcon.png",
                        height: 14,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizeBoxH(15),
            isFromMyRide
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonBannerButtonWidget(
                        bgColor: AppConstants.appPrimaryColor,
                        text: "Show intrest",
                        borderColor: AppConstants.appPrimaryColor,
                        textColor: AppConstants.black,
                        width: Responsive.width * 35,
                        height: Responsive.height * 4,
                        radius: 8,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
