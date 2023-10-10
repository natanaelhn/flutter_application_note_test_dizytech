import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';

class MobileHomeAppbar extends StatelessWidget {
  const MobileHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 12, left: 20, right: 20),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'All Notes',
              style: TextStyle(
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          PopupMenuButton(
            surfaceTintColor: Colors.white,
            constraints: const BoxConstraints(minWidth: 200),
            itemBuilder: (context){
              return [
                const PopupMenuItem(child: Text('Edit')),
                const PopupMenuItem(child: Text('View')),
                const PopupMenuItem(child: Text('Pin on top')),
              ];
            }
          )
        ],
      ),
    );
  }
}