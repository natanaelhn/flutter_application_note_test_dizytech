import 'package:flutter_application_note_test_dizytech/util/datetime_format.dart';

class NoteFields{
  static const String id = 'id';
  static const String body = 'body';
  static const String title = 'title';
  static const String updatedAt = 'updated_at';
  static const String createdAt = 'created_at';
}

class NoteModel{

  NoteModel({
    this.id,
    this.title,
    this.body,
    this.updatedAt,
    this.createdAt,
  });

  final int? id;
  final String? title;
  final String? body;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  ///Convert from NoteModel to JSON
  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.body: body,
    NoteFields.title: title,
    NoteFields.updatedAt: updatedAt != null ? DateTimeFormat.dateTimeToString3(updatedAt!) : null,
    NoteFields.createdAt: createdAt != null ? DateTimeFormat.dateTimeToString3(createdAt!) : null,
  };

  ///Change the value of NoteModel
  NoteModel copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? updatedAt,
    DateTime? createdAt,
  }){
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title, 
      body: body ?? this.body, 
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  ///Convert from JSON to NoteModel
  static NoteModel fromJson(Map<String, Object?> json){
    print(json);
    return NoteModel(
      id: json[NoteFields.id] as int?,
      title: json[NoteFields.title] as String?,
      body: json[NoteFields.body] as String?,
      updatedAt: DateTimeFormat.stringToDateTime(json[NoteFields.updatedAt] as String?),
      createdAt: DateTimeFormat.stringToDateTime(json[NoteFields.createdAt] as String?),
    );
  }

}