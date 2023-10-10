import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/bloc/note_list_bloc/note_list_bloc.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/home_page.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_color_style.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileDetailAppbar extends StatelessWidget {
  const MobileDetailAppbar({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 12, left: 20, right: 20),
      child: Row(
        children: [
          BlocBuilder<DeviceTypeBloc, DeviceTypeState>(
            bloc: BlocProvider.of<DeviceTypeBloc>(context),
            builder: (context, state) {

              ///Back button will be shown if the device size is mobile sized
              return Visibility(
                visible: state.deviceType == DeviceType.mobile ? true : false,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              );
            },
          ),
          Expanded(
            child: Text(
              note.title.toString(),
              style: const TextStyle(
                fontFamily: CustomTextStyle.interFontFamily,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.zoom_out_map)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
          PopupMenuButton(
              surfaceTintColor: Colors.white,
              constraints: const BoxConstraints(minWidth: 200),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text('Edit'),
                    onTap: () {
                      DeviceType deviceType = BlocProvider.of<DeviceTypeBloc>(context).state.deviceType;
                      _showEditDialog(context: context, note: note, deviceType: deviceType);
                    }),
                  PopupMenuItem(
                    child: const Text('Delete'),
                    onTap: () {
                      _showDeleteDialog(context: context, note: note);
                    },
                  ),
                  const PopupMenuItem(child: Text('Print')),
                ];
              })
        ],
      ),
    );
  }
}

///A method to show edit dialog for mobile or not mobile
void _showEditDialog({required context, required NoteModel note, required DeviceType deviceType}) {
  showDialog(
    context: context,
    builder: (context) {
      GlobalKey<FormState> formKey = GlobalKey<FormState>();
      TextEditingController titleController =
          TextEditingController(text: note.title);
      TextEditingController bodyController =
          TextEditingController(text: note.body);

      return Padding(
          ///Padding will be adjusted by the Device Type
          padding: EdgeInsets.symmetric(horizontal: deviceType == DeviceType.mobile ? 20 : 180, vertical: 135),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///First Row: Back button, 'Edit Note', and Save button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const Expanded(
                            child: Text(
                              'Edit Note',
                              style: TextStyle(
                                color: Color(0xFF49454F),
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<NoteListBloc>(context).add(NoteListUpdateEvent(
                                  note: note.copyWith(
                                    title: titleController.text,
                                    body: bodyController.text,
                                  )
                                ));
                                DeviceType deviceType = BlocProvider.of<DeviceTypeBloc>(context).state.deviceType;
                                Navigator.pop(context);
                                if(deviceType == DeviceType.mobile){
                                  Navigator.pop(context);
                                }
                              },
                              icon: const Icon(Icons.save_outlined)),
                        ],
                      ),
                    ),

                    ///Second Row: Title TextFormField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: titleController,
                        textAlignVertical: TextAlignVertical.top,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.33,
                          fontFamily: CustomTextStyle.interFontFamily,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.17,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Text Area Judul',
                          hintStyle: TextStyle(
                              color: Color(0xFF717D96),
                              fontSize: 16,
                              fontFamily: CustomTextStyle.interFontFamily,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFFCBD2E0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(
                                width: 2, color: CustomColorStyle.green),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),

                    ///Third Row: Body TextFormField
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 34, left: 20, right: 20),
                        child: TextFormField(
                          controller: bodyController,
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17.33,
                            fontFamily: CustomTextStyle.interFontFamily,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.17,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Text Area Body',
                            hintStyle: TextStyle(
                                color: Color(0xFF717D96),
                                fontSize: 16,
                                fontFamily: CustomTextStyle.interFontFamily,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFCBD2E0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(
                                  width: 2, color: CustomColorStyle.green),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    },
  );
}


///A method to show delete dialog for mobile or not mobile
void _showDeleteDialog(
    {required BuildContext context, required NoteModel note}) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: Container(
              width: 312,
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hapus Catatan',
                    style: TextStyle(
                      color: Color(0xFF1D1B20),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Apakah kamu yakin ingin menghapus catatan ini?',
                    style: TextStyle(
                      color: Color(0xFF49454F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  CustomColorStyle.green.withOpacity(0.20))),
                          child: const Text(
                            'Batal',
                            style: TextStyle(
                              color: Color(0xFF1A202C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<NoteListBloc>(context).add(NoteListDeleteEvent(note: note));
                            DeviceType deviceType = BlocProvider.of<DeviceTypeBloc>(context).state.deviceType;
                            Navigator.pop(context);
                            if(deviceType == DeviceType.mobile){
                              Navigator.pop(context);
                            }
                          },
                          style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  CustomColorStyle.green.withOpacity(0.20))),
                          child: const Text(
                            'Hapus Catatan',
                            style: TextStyle(
                              color: Color(0xFF1A202C),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ));
}
