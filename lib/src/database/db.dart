import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    await _initDatabase();
    return _database!;
    // return _database!;
  }

  Future<void> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'catalogo_de_livro4.db');

    // if (await databaseExists(databasePath)) {
    //   await deleteDatabase(databasePath);
    // }

    // return await openDatabase(
    //   join(path, 'catalogo_de_livro4.db'),
    //   version: 1,
    //   onCreate: _onCreate,
    //   // onUpgrade: _onUpgrade,
    // );

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Future<void> deleteDatabase() async {
  //   final path = await getDatabasesPath();
  //   final databasePath = join(path, 'catalogo_de_livro4.db');
  //   await deleteDatabase(databasePath);
  //   _database = null;
  // }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(" CREATE TABLE tb_usuario ( "
        " id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " email TEXT NOT NULL, "
        " password TEXT NOT NULL) ");
    await db.execute("CREATE TABLE tb_livro ( "
        " id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " title TEXT NOT NULL, "
        " autor TEXT NOT NULL, "
        " genre TEXT NOT NULL, "
        " publication_year INTEGER NOT NULL) ");
  }
}
