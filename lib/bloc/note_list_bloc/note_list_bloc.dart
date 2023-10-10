import 'package:bloc/bloc.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/service/note_service.dart';
import 'package:meta/meta.dart';

part 'note_list_event.dart';
part 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {

  NoteService noteService = NoteService();

  NoteListBloc() : super(const NoteListInitialState()) {
    on<NoteListLoadEvent>((event, emit) async{
      try{
        List<Map<String, Object?>> listOfNoteJson = await noteService.getAll();
        List<NoteModel> listOfNoteModel = listOfNoteJson.map((e) => NoteModel.fromJson(e)).toList();
        emit(NoteListLoadedState(listNote: listOfNoteModel));
      }
      catch (e){
        emit(const NoteListLoadedState(listNote: []));
      }
    });

    on<NoteListCreateEvent>((event, emit) async{
      try{
        Map<String, Object?>? json = await noteService.postCreate(note: event.note);
        if(json != null){
          List<Map<String, Object?>> listOfNoteJson = await noteService.getAll();
          List<NoteModel> listOfNoteModel = listOfNoteJson.map((e) => NoteModel.fromJson(e)).toList();
          emit(NoteListLoadedState(listNote: listOfNoteModel));
        }
      }
      catch (e){
        emit(const NoteListLoadedState(listNote: []));
      }
    });

    on<NoteListUpdateEvent>((event, emit) async {
      try{
        Map<String, Object?>? json = await noteService.putEdit(note: event.note);
        if(json != null){
          List<Map<String, Object?>> listOfNoteJson = await noteService.getAll();
          List<NoteModel> listOfNoteModel = listOfNoteJson.map((e) => NoteModel.fromJson(e)).toList();
          emit(NoteListLoadedState(listNote: listOfNoteModel));
        }
      }
      catch (e){
        emit(const NoteListLoadedState(listNote: []));
      }
    });

    on<NoteListDeleteEvent>((event, emit) async {
      try{
        Map<String, Object?>? json = await noteService.delDelete(note: event.note);
        if(json != null){
          List<Map<String, Object?>> listOfNoteJson = await noteService.getAll();
          List<NoteModel> listOfNoteModel = listOfNoteJson.map((e) => NoteModel.fromJson(e)).toList();
          emit(NoteListLoadedState(listNote: listOfNoteModel));
        }
      }
      catch (e){
        emit(const NoteListLoadedState(listNote: []));
      }
    });
  }
}
