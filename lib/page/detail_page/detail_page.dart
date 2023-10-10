import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/detail_page/mobile_size/mobile_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.note});

  final NoteModel note;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(BlocProvider.of<DeviceTypeBloc>(context).state.deviceType == DeviceType.notMobile){
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<DeviceTypeBloc, DeviceTypeState>(
      bloc: BlocProvider.of<DeviceTypeBloc>(context),
      builder: (context, state) {
        if(state.deviceType == DeviceType.mobile){
          return MobileDetailPage(note: widget.note);
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}