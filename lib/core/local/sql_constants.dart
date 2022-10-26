class SQLConstants {
  static const String databaseName = 'notes.db';
  static const String notesTable = 'notes';

  // static const String nameTable = '-----';
  static const String _query = '?';
  static const String _idColumn = 'id';
  static const String _titleColumn = 'title';
  static const String _detailsColumn = 'details';
  static const String _colorColumn = 'color';
  static const String intType = 'INTEGER';
  static const String textType = 'TEXT';
  static const String createTableSql = '''CREATE TABLE "$notesTable" (
    "$_idColumn" $intType NOT NULL PRIMARY KEY AUTOINCREMENT,
    "$_titleColumn" $textType NOT NULL,
    "$_detailsColumn" $textType NOT NULL,
    "$_colorColumn" $textType NOT NULL)''';

  static String get query => _query;

  static String get id => _idColumn;

  static String get title => _titleColumn;

  static String get details => _detailsColumn;

  static String get color => _colorColumn;

  static String upgradeTableSql({
    required String tableName,
    required String columnName,
    required String columnType,
  }) =>
      'ALTER TABLE "$tableName" ADD COLUMN $columnName $columnType';

  static String getItemById(String tableName, int id) =>
      'select * from $tableName where id="$id"';
}
