import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/mobile_size/widget/mobile_detail_appbar.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/mobile_size/widget/mobile_detail_content.dart';

class MobileDetailPage extends StatelessWidget {
  const MobileDetailPage({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            ///This is an appbar for mobile home page
            MobileDetailAppbar(note: note),
            MobileDetailContent(note: note),
          ],
        ),
      ),
    );
  }
}