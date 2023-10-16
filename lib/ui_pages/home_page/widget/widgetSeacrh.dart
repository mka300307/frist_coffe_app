import 'dart:async';
import 'package:flutter/material.dart';

import '../../../reuse_component/customIcon.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({Key? key}) : super(key: key);

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  final List<String> textItems = [
    "Search Coffee...",
    "Start your day with coffee",
    "Fresh and Delicious Coffee",
  ];

  // Timer to control auto-scrolling
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Start auto-scrolling timer
    _startAutoScrolling();
  }

  @override
  void dispose() {
    // Dispose of the timer when not needed
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScrolling() {
    const Duration scrollDuration = const Duration(seconds: 3);

    _timer = Timer.periodic(scrollDuration, (Timer timer) {
      setState(() {
        if (_currentIndex < textItems.length - 1) {
          _currentIndex++;
        } else {
          // Reset to the first item when reaching the end
          _currentIndex = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIcon(icon: Icons.search, size: 35, color: Colors.black),
        SizedBox(width: 10), // Add spacing between icon and text
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              textItems[_currentIndex],
              style: TextStyle(
                color: Color(0xff9f9f9f),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Container(
          width: 30, // Adjust the width as needed
          height: 30, // Adjust the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffcf9f69),
          ),
          child: CustomIcon(
            icon: Icons.sort_rounded,
            size: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
