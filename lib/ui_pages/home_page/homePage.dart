
import 'package:coffe_app/reuse_component/customText.dart';
import 'package:coffe_app/ui_pages/home_page/widget/widgetAvatar.dart';
import 'package:coffe_app/ui_pages/home_page/widget/widgetCategory.dart';
import 'package:coffe_app/ui_pages/home_page/widget/widgetListBarista.dart';
import 'package:coffe_app/ui_pages/home_page/widget/widgetListDiskon.dart';
import 'package:coffe_app/ui_pages/home_page/widget/widgetSeacrh.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../reuse_component/widgetBottomNavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;
    final size = MediaQuery.of(context).size;
    final tingi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffdedede),
      body: Container(
        height: size.height*2,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top,),
              WidgetAvatar(),
              SizedBox(height: size.height*0.01,),
              Container(
                height: size.height*0.72,
                width: size.width,
                child: SingleChildScrollView(
                  child:
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5, left: 15, right: 15, bottom: 5),
                                child: WidgetSearch()),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomText(
                            text: "Categories",
                            color: Color(0xff382e1e),
                            fontWeight: FontWeight.bold,
                            size: 20),
                        SizedBox(
                          height: tingi * 0.02,
                        ),
                        CoffeeMenu(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomText(
                            text: "Special Offer 🔥",
                            color: Color(0xff382e1e),
                            fontWeight: FontWeight.bold,
                            size: 20),
                        SizedBox(height: size.height*0.02,),
                        WidgetDiskon(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomText(
                            text: "Our Coffee Expert",
                            color: Color(0xff382e1e),
                            fontWeight: FontWeight.bold,
                            size: 20),
                        SizedBox(height: size.height*0.02,),
                        WidgetListBarista()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(
        currentIndex: currentIndex,
      ),
    );
  }
}


