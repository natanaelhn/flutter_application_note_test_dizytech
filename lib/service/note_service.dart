import 'package:dio/dio.dart';
import 'package:flutter_application_note_test_dizytech/model/note_model.dart';
import 'package:flutter_application_note_test_dizytech/util/datetime_format.dart';

class NoteService{
  final Dio _dio = Dio();
  final String _baseUrl = 'https://retoolapi.dev/uRyMUB/notes';
  // final String _baseUrl = 'https://reqres.in/api/users/2';

  Future<List<Map<String, Object?>>> getAll() async{
    Response response;

    try{
      print('started');
      response = await _dio.get(
        _baseUrl,
      );
      print(response.data);
      return (response.data as List).map((e) => e as Map<String, Object?>).toList();
    }
    on DioException catch(e){
      print('e');
      return [];
    }
    on Error catch(e){
      print(e);
      print('e');
      return [];
    }
  }

  Future<Map<String, Object?>?> postCreate({required NoteModel note}) async{
    Response response;

    try{
      response = await _dio.post(
        _baseUrl,
        data: {
          NoteFields.title: note.title,
          NoteFields.body: note.body,
          NoteFields.createdAt: DateTimeFormat.dateTimeToString3(DateTime.now()),
        }
      );
      return response.data as Map<String, Object?>;
    }
    on DioException catch(e){
      print('e');
      return null;
    }
    on Error catch(e){
      print(e);
      print('e');
      return null;
    }
  }

  Future<Map<String, Object?>?> putEdit({required NoteModel note}) async{
    Response response;

    try{
      response = await _dio.put(
        '$_baseUrl/${note.id}',
        data: {
          NoteFields.id: note.id,
          NoteFields.title: note.title,
          NoteFields.body: note.body,
          NoteFields.createdAt: DateTimeFormat.dateTimeToString3(DateTime.now()),
        }
      );
      return response.data as Map<String, Object?>;
    }
    on DioException catch(e){
      print('e');
      return null;
    }
    on Error catch(e){
      print(e);
      print('e');
      return null;
    }
  }

  Future<Map<String, Object?>?> delDelete({required NoteModel note}) async{
    Response response;

    try{
      response = await _dio.delete(
        '$_baseUrl/${note.id}',
      );
      return response.data as Map<String, Object?>;
    }
    on DioException catch(e){
      print('e');
      return null;
    }
    on Error catch(e){
      print(e);
      print('e');
      return null;
    }
  }
}