import 'package:flutter/material.dart';
import 'package:flutter_application_note_test_dizytech/bloc/note_list_bloc/note_list_bloc.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/page/home_page/mobile_size/widget/note_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridNoteList extends StatelessWidget {
  const GridNoteList({super.key, required this.listOfModel});

  final List<NoteModel> listOfModel;

  @override
  Widget build(BuildContext context) {

    List<NoteModel> list = [
      NoteModel(title: 'Title1', body: 'Body1', updatedAt: DateTime.now()),
      NoteModel(title: 'Title2', body: 'Body2', updatedAt: DateTime.now().subtract(const Duration(days: 1))),
      NoteModel(title: 'Title3', body: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', updatedAt: DateTime.now().subtract(const Duration(days: 3))),
    ];

    return BlocBuilder<NoteListBloc, NoteListState>(
      bloc: BlocProvider.of<NoteListBloc>(context),
      builder: (context, state) {

        // List<NoteModel> list = state.listNote;

        return LayoutBuilder(
          builder: (context, constraints) {
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 16,

              ///This ratio made is to make sure the child height will not be changed
              childAspectRatio:
                  // ((MediaQuery.of(context).size.width - 20 - 20 - 16) / 2) / 240,
                  ((constraints.maxWidth - 20 - 20 - 16) / 2) / 240,
              children: listOfModel.map((e) => NoteListItem(note: e,)).toList()
            );
          }
        );
      },
    );
  }
}
