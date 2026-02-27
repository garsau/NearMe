import '../database.dart';

class PostsWithAuthorsTable extends SupabaseTable<PostsWithAuthorsRow> {
  @override
  String get tableName => 'posts_with_authors';

  @override
  PostsWithAuthorsRow createRow(Map<String, dynamic> data) =>
      PostsWithAuthorsRow(data);
}

class PostsWithAuthorsRow extends SupabaseDataRow {
  PostsWithAuthorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostsWithAuthorsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  bool? get isBottle => getField<bool>('is_bottle');
  set isBottle(bool? value) => setField<bool>('is_bottle', value);

  int? get votesScore => getField<int>('votes_score');
  set votesScore(int? value) => setField<int>('votes_score', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lng => getField<double>('lng');
  set lng(double? value) => setField<double>('lng', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get authorId => getField<String>('author_id');
  set authorId(String? value) => setField<String>('author_id', value);
}
