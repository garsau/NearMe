import '../database.dart';

class PostsTable extends SupabaseTable<PostsRow> {
  @override
  String get tableName => 'posts';

  @override
  PostsRow createRow(Map<String, dynamic> data) => PostsRow(data);
}

class PostsRow extends SupabaseDataRow {
  PostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);

  int? get votesScore => getField<int>('votes_score');
  set votesScore(int? value) => setField<int>('votes_score', value);

  bool? get isBottle => getField<bool>('is_bottle');
  set isBottle(bool? value) => setField<bool>('is_bottle', value);

  DateTime? get deletedAt => getField<DateTime>('deleted_at');
  set deletedAt(DateTime? value) => setField<DateTime>('deleted_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
