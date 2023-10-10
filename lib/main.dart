import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/bloc/note_list_bloc/note_list_bloc.dart';
import 'package:flutter_application_note_test_dizytech/cubit/note_detail_cubit.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeviceTypeBloc(),),
        BlocProvider(create: (context) => NoteListBloc(),),
        BlocProvider(create: (context) => NoteDetailCubit(null),),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
