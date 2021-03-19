import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/CARD_PRODUCT_MODEL.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CardDatabaseHelped {
  CardDatabaseHelped._();
  static final CardDatabaseHelped db = CardDatabaseHelped._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CardProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCardProduct (
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL,
        $columnProductid TEXT NOT NULL)
      ''');
    });
  }

  Future<List<CardProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCardProduct);
    List<CardProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CardProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CardProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(tableCardProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CardProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableCardProduct, model.toJson(),
        where: '$columnProductid = ?', whereArgs: [model.productid]);
  }
}
