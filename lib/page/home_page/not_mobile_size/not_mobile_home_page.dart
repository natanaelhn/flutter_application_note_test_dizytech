import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/not_mobile_size/not_detail_page.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/mobile_home_page.dart';

class NotMobileHomePage extends StatelessWidget {
  const NotMobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ///Taking the homepage of mobile sized to non mobile sized
            const SizedBox(
              width: 440,
              child: MobileHomePage(),
            ),
            Container(width: 4, color: const Color(0xFFE5E7EB),),
            const Expanded(
              child: NotMobileDetailPage(),
            )
          ],
        ),
      ),
    );
  }
}