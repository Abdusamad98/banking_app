import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();

  LocalDataBase._();

  factory LocalDataBase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDB("database.db");
      return _database!;
    }
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    // const textType = "TEXT NOT NULL";
    // const intType = "INTEGER DEFAULT 0";

    // await db.execute('''
    // CREATE TABLE $userTable (
    // ${CachedUsersFields.id} $idType,
    // ${CachedUsersFields.age} $intType,
    // ${CachedUsersFields.name} $textType,
    // ${CachedUsersFields.count} $intType
    // )
    // ''');
  }

//-------------------------------------------Cached Users Table------------------------------------

// static Future<CachedUser> insertCachedUser(CachedUser cachedUser) async {
//   final db = await getInstance.database;
//   final id = await db.insert(userTable, cachedUser.toJson());
//   return cachedUser.copyWith(id: id);
// }
//
// static Future<CachedUser> insertCachedUserFromAPI(UserData userData) async {
//   final db = await getInstance.database;
//   CachedUser cachedUser = CachedUser(age: userData.age, name: userData.name, count: userData.count);
//   final id = await db.insert(userTable, cachedUser.toJson());
//   return cachedUser.copyWith(id: id);
// }
//
// static Future<List<CachedUser>> getAllCachedUsers() async {
//   final db = await getInstance.database;
//   const orderBy = CachedUsersFields.id;
//   final result = await db.query(userTable, orderBy: orderBy);
//   return result.map((lottie) => CachedUser.fromJson(lottie)).toList();
// }
//
// static Future<int> deleteAllCachedUsers() async {
//   final db = await getInstance.database;
//   return await db.delete(userTable);
// }
}