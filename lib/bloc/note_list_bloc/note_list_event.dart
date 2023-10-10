part of 'note_list_bloc.dart';

@immutable
sealed class NoteListEvent {
  const NoteListEvent();
}

final class NoteListLoadEvent extends NoteListEvent{

}

final class NoteListCreateEvent extends NoteListEvent{
  const NoteListCreateEvent({required this.note});

  final NoteModel note;
}

final class NoteListUpdateEvent extends NoteListEvent{
  const NoteListUpdateEvent({required this.note});

  final NoteModel note;
}

final class NoteListDeleteEvent extends NoteListEvent{
  const NoteListDeleteEvent({required this.note});

  final NoteModel note;
}
