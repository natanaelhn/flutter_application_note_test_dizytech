import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/bloc/note_list_bloc/note_list_bloc.dart';
import 'package:flutter_application_note_test_dizytech/cubit/note_detail_cubit.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/mobile_home_page.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/not_mobile_size/not_mobile_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    print('initstate');
    super.initState();
    BlocProvider.of<NoteListBloc>(context).add(NoteListLoadEvent());
    BlocProvider.of<NoteDetailCubit>(context).changeState(null);
  }

  @override
  void didChangeDependencies() {
    print('didchangedependencies');
    super.didChangeDependencies();
    // BlocProvider.of<NoteListBloc>(context).add(NoteListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<DeviceTypeBloc>(context).add(DeviceTypeDetermineEvent(width: MediaQuery.of(context).size.width.toInt()));
    
    return BlocBuilder<DeviceTypeBloc, DeviceTypeState>(
      bloc: BlocProvider.of<DeviceTypeBloc>(context),
      builder: (context, state) {
        if(state.deviceType == DeviceType.mobile){
          return const MobileHomePage();
        }
        else{
          return const NotMobileHomePage();
        }
      },
    );
  }
}
