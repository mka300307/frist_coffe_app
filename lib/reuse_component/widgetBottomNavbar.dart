import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final RxInt currentIndex;
  BottomNavigationBarComponent({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GNav(
            color: Color(0xFF959595),
            backgroundColor: Colors.white,
            activeColor: Color(0xFF00512D),
            gap: 8,
            iconSize: 27,
            selectedIndex: currentIndex.value, // Set the selected index
            // onTabChange: (index) {
            //   currentIndex.value = index; // Update the selected index
            //   switch (index) {
            //     case 0:
            //       Get.toNamed('/home');
            //       break;
            //     case 1:
            //       Get.toNamed('/favorite');
            //       break;
            //     case 2:
            //       Get.toNamed('/chart');
            //       break;
            //     case 3:
            //       Get.toNamed('/notif');
            //       break;
            //     default:
            //       break;
            //   }
            // },
            tabs: const [
              GButton(icon: Icons.home_filled, text: "home"),
              GButton(icon: Icons.favorite, text: "favorite"),
              GButton(icon: Icons.shopping_bag, text: "chart"),
              GButton(icon: Icons.notifications, text: "notif"),
            ],
          ),
        ),
      );
    });
  }
}
