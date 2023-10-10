import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      alignment: Alignment.topRight,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.filter_list, size: 14,),
          SizedBox(width: 12),
          Text(
            'Title',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: CustomTextStyle.interFontFamily,
              fontWeight: FontWeight.w600,
              height: 0.12,
            ),
          ),
          SizedBox(width: 12),
          Icon(Icons.arrow_downward_rounded, size: 14),
        ],
      ),
    );
  }
}