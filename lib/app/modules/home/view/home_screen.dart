import 'package:flutter/material.dart';
import 'package:uni_bike/app/helpers/size_box.dart';
import 'package:uni_bike/app/utils/app_constants.dart';

import '../widget/active_rides_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        toolbarHeight: 80,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemBuilder: (context, index) {
          return const EventDetailsContainer();
        },
        separatorBuilder: (context, index) => const SizeBoxH(20),
        itemCount: 10,
      ),
    );
  }
}
