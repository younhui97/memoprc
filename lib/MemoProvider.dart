import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableName = 'memo';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnContent = 'content';

class Memo {
  int id=0;
  String title;
  String content;

  Memo({id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnContent: content,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    content = map[columnContent];
    print('$id, $title, $content');
  }
}
class MemoProvider {
  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'memo.db');

    return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE $tableName(
            $columnId integer primary key autoincrement, 
            $columnTitle text not null,
            $columnContent text not null
          )
        ''');
        },
        onUpgrade: (db, oldVersion, newVersion){}
    );
  }

  Future<Memo> insert(Memo memo) async {
    final db = await database;
    print(memo.toMap());
    memo.id = (await db?.insert(tableName, memo.toMap()))!;
    return memo;
  }
}