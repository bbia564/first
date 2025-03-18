import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import './db_config.dart';

class LeaseDatabaseService extends GetxService {
  static const _databaseName = 'lease.db';
  static const _databaseVersion = 1;
  static const table = 'lease';
  static const columnId = 'id';
  static const columnImageUrl = 'imageUrl';
  static const columnArea = 'area';
  static const columnAddress = 'address';
  static const columTime = 'time';

  static final LeaseDatabaseService _instance =
      LeaseDatabaseService._internal();

  factory LeaseDatabaseService() => _instance;

  LeaseDatabaseService._internal();

  late Database _database;
  final RxList<Lease> lease = <Lease>[].obs;

  Future<Database> get database async {
    _database = await _initDataBase();
    return _database;
  }

  Future<Database> _initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
        $columnId INTEGER PRIMARY KEY,
        $columnImageUrl BLOB NOT NULL,
        $columnArea REAL NOT NULL,
        $columnAddress TEXT NOT NULL,
        $columTime TEXT NOT NULL
      )
    ''');
  }

  Future<int> addLease(Lease lease) async {
    Database db = await database;
    var result =
        await db.rawQuery('SELECT MAX($columnId) as maxId FROM $table');
    int? maxId = result.first['maxId'] as int?;
    int newId = (maxId ?? 0) + 1;
    Lease newLease = Lease(
        id: newId,
        imageUrl: lease.imageUrl,
        area: lease.area,
        address: lease.address,
        time: lease.time);
    int insertedId = await db.insert(table, newLease.toMap());
    await refreshLeases();
    return insertedId;
  }

  Future<List<Lease>> getAllHouse() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (int index) {
      return Lease.fromMap(maps[index]);
    });
  }

  Future<Lease?> getLeaseByID(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query(table, where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Lease.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateLease(Lease lease) async {
    Database db = await database;
    int updateRows = await db.update(table, lease.toMap(),
        where: '$columnId = ?', whereArgs: [lease.id]);
    await refreshLeases();
    return updateRows;
  }

  Future<int> deleteLease(int id) async {
    Database db = await database;
    int deleteRows =
        await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    await refreshLeases();
    return deleteRows;
  }

  void cleanLease() async {
    Database db = await database;
    await db.delete(table);
    await refreshLeases();
  }

  Future<void> refreshLeases() async {
    lease.value = await getAllHouse();
  }

  void cleanDiaryData() async {
    Database db = await database;
    await db.delete('lease');
  }
}
