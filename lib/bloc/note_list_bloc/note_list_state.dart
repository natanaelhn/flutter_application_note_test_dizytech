part of 'note_list_bloc.dart';

@immutable
sealed class NoteListState {
  const NoteListState({this.listNote = const []});
  
  final List<NoteModel> listNote;
}

final class NoteListInitialState extends NoteListState {
  const NoteListInitialState() : super();
}

final class NoteListLoadedState extends NoteListState {
  const NoteListLoadedState({required List<NoteModel> listNote}) : super(listNote: listNote);
}
