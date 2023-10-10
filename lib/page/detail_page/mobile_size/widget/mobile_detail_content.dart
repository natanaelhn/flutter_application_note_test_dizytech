import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';
import 'package:flutter_application_note_test_dizytech/util/datetime_format.dart';

class MobileDetailContent extends StatelessWidget {
  const MobileDetailContent({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///To maximize the width of Column
            const SizedBox(width: double.infinity,),
      
            ///The title
            Text(
              note.title.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.22,
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.20, 
              ),
            ),
      
            ///The date and length of character
            Row(
              children: [
                Text(
                  DateTimeFormat.dateTimeToString4((note.createdAt != null) ? note.createdAt! : note.updatedAt!),
                  style: const TextStyle(
                    color: Color(0xFF4A5468),
                    fontSize: 14,
                    fontFamily: CustomTextStyle.interFontFamily,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.14,  
                  ),
                ),
                Text(
                  ' | ${note.body?.length} characters',
                  style: const TextStyle(
                    color: Color(0xFF4A5468),
                    fontSize: 14,
                    fontFamily: CustomTextStyle.interFontFamily,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.14,  
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7,),
      
            ///The body
            Text(
              note.body.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17.33,
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.17, 
              ),
            )
          ],
        ),
      ),
    );
  }
}