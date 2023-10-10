import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_color_style.dart';
import 'package:flutter_application_note_test_dizytech/style/custom_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController? controller;
  _SearchTextIsEmptyCubit? isEmptyCubit;

  @override
  Widget build(BuildContext context) {
    controller = (widget.controller != null)
        ? widget.controller!
        : TextEditingController();
    isEmptyCubit = _SearchTextIsEmptyCubit(controller!.text.isEmpty);

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
      child: SizedBox(
        height: 48,
        child: BlocBuilder<_SearchTextIsEmptyCubit, bool>(
          bloc: isEmptyCubit,
          builder: (context, state) {
            return TextField(
              cursorColor: CustomColorStyle.green,
              controller: controller,
              onChanged: (value) {
                isEmptyCubit!.changeState(value.isEmpty);        //change the state of isEmptyCubit for every change of textField
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff717D96),
                ),
                hintText: 'Search notes',
                suffixIcon: GestureDetector(
                    onTap: () {
                      //clear the text and change the state of isEmptyCubit to true
                      controller!.clear();
                      isEmptyCubit!.changeState(true);
                    },
                    child: Visibility(
                      visible: !state,          //Button cancel will not visible if searchTextIsEmpty is true
                      child: const Icon(Icons.cancel, color: Color(0xff717D96)))
                    ),
                hintStyle: const TextStyle(
                    color: Color(0xFF717D96),
                    fontSize: 16,
                    fontFamily: CustomTextStyle.interFontFamily,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.16),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(width: 2, color: Color(0xFFCBD2E0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide:
                      BorderSide(width: 2, color: CustomColorStyle.green),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///A cubit which will provide a state that tells the textField is empty or not
class _SearchTextIsEmptyCubit extends Cubit<bool> {
  _SearchTextIsEmptyCubit(super.initialState);

  void changeState(bool isEmpty){
    emit(isEmpty);
  }
}
