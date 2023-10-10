import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteDetailCubit extends Cubit<NoteModel?>{
  NoteDetailCubit(super.initialState);
  
  void changeState(NoteModel? note){
    emit(note);
  }
}