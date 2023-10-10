import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/cubit/note_detail_cubit.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/detail_page.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';
import 'package:flutter_application_note_test_dizytech/util/datetime_format.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        ///The Card Container
        Expanded(
          child: Material(
            color: const Color(0xFFF7F9FC),
            elevation: 2,
            // shadowColor: const Color(0x19000000),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                DeviceType deviceType = BlocProvider.of<DeviceTypeBloc>(context).state.deviceType;
                if(deviceType == DeviceType.mobile){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(note: note),));
                }
                else{
                  BlocProvider.of<NoteDetailCubit>(context).changeState(note);
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    ///Title text
                    Text(
                      note.title.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: CustomTextStyle.interFontFamily,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.14, 
                      ),
                    ),
                    const SizedBox(height: 4,),
                
                    ///Body text
                    Expanded(
                      child: Text(
                        note.body.toString(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 7,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: CustomTextStyle.interFontFamily,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.12, 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,),
    
        ///Text under card
        Column(
          children: [
            Text(
              note.title.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.14, 
              ),
            ),
            Text(
              _dateTimeFormat(dateTime: (note.createdAt != null) ? note.createdAt! : note.updatedAt!),
              style: const TextStyle(
                color: Color(0xFF717D96),
                fontSize: 14,
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.14, 
              ),
            ),
          ],
        )
      ],
    );
  }

  String _dateTimeFormat({required DateTime dateTime}){
    DateTime now = DateTime.now();
    if(dateTime.day == now.day){
      return DateTimeFormat.dateTimeToString2(dateTime);
    }
    else{
      return DateTimeFormat.dateTimeToString(dateTime);
    }
  }
}