import '../database.dart';

class PostLikesTable extends SupabaseTable<PostLikesRow> {
  @override
  String get tableName => 'post_likes';

  @override
  PostLikesRow createRow(Map<String, dynamic> data) => PostLikesRow(data);
}

class PostLikesRow extends SupabaseDataRow {
  PostLikesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostLikesTable();

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get value => getField<int>('value')!;
  set value(int value) => setField<int>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
