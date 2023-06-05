import 'dart:io';
import 'package:ecowave/features/cart/model/entity/cart_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = 'eco_database.db';
  final int _databaseVersion = 1;

  final String table = 'cart';
  final String id = 'id';
  final String nameItems = 'nameItems';
  final String detailItems = 'detailItems';
  final String price = 'price';
  final String totalItems = 'totalItems';
  final String image = 'image';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $nameItems TEXT NULL, $detailItems TEXT NULL, $price INTEGER NULL, $totalItems INTEGER NULL, $image TEXT NULL)');
  }

  Future<List<CartModel>> all() async {
    final data = await _database!.query(table);
    List<CartModel> result = data.map((e) => CartModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(table, row);
    return query;
  }

  Future delete(int idParam) async {
    await _database!.delete(table, where: '$id = ?', whereArgs: [idParam]);
  }

  Future deleteAll() async {
    await _database!.delete(table);
  }

  Future updateTotalItem(int idParam, Map<String, dynamic> row) async {
    await _database!.update(table, row, where: '$id = ?', whereArgs: [idParam]);
  }
}
