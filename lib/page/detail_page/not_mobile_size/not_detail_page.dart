import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/cubit/note_detail_cubit.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/mobile_size/mobile_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotMobileDetailPage extends StatefulWidget {
  const NotMobileDetailPage({super.key,});

  @override
  State<NotMobileDetailPage> createState() => _NotMobileDetailPageState();
}

class _NotMobileDetailPageState extends State<NotMobileDetailPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteDetailCubit, NoteModel?>(
      builder: (context, state) {
        if(state != null){
          return MobileDetailPage(note: state);
        }
        else{
          return const Center(child: Text('Choose a note'));
        }
      },
    );
  }
}