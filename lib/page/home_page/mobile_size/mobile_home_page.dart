import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/device_type_bloc/device_type_bloc.dart';
import 'package:flutter_application_note_test_dizytech/bloc/note_list_bloc/note_list_bloc.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/widget/grid_note_list.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/widget/mobile_home_appbar.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/widget/search_text_field.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/widget/sort_button.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_color_style.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            ///This is an appbar for mobile home page
            const MobileHomeAppbar(),

            ///This is a search text field
            SearchTextField(controller: searchController),

            ///This is a sort button
            const SortButton(),

            ///This is a grid list that contain list of note
            Expanded(child: BlocBuilder<NoteListBloc, NoteListState>(
              builder: (context, state) {
                return GridNoteList(
                    listOfModel: state.listNote
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          DeviceType deviceType = BlocProvider.of<DeviceTypeBloc>(context).state.deviceType;
          _showCreateDialog(context: context, deviceType: deviceType);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}



///A method to show edit dialog for mobile or not mobile
void _showCreateDialog({required context, required DeviceType deviceType}) {
  showDialog(
    context: context,
    builder: (context) {
      GlobalKey<FormState> formKey = GlobalKey<FormState>();
      TextEditingController titleController = TextEditingController();
      TextEditingController bodyController = TextEditingController();

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
                              'New Note',
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
                                BlocProvider.of<NoteListBloc>(context).add(NoteListCreateEvent(note: NoteModel(
                                  body: bodyController.text,
                                  title: titleController.text,
                                  createdAt: DateTime.now(),
                                )));
                                Navigator.pop(context);
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