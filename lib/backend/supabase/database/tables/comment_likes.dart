import '../database.dart';

class CommentLikesTable extends SupabaseTable<CommentLikesRow> {
  @override
  String get tableName => 'comment_likes';

  @override
  CommentLikesRow createRow(Map<String, dynamic> data) => CommentLikesRow(data);
}

class CommentLikesRow extends SupabaseDataRow {
  CommentLikesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentLikesTable();

  String get commentId => getField<String>('comment_id')!;
  set commentId(String value) => setField<String>('comment_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get value => getField<int>('value')!;
  set value(int value) => setField<int>('value', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
