import 'dart:math';

import 'package:camping_ground/app/modules/diary_page/controllers/diary_page_controller.dart';
import 'package:camping_ground/app/tools/models.dart';
import 'package:camping_ground/app/tools/shared_preferences.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CGDatabaseTool extends GetxService {
  late Database db;
  String lastTime = "";
  Future<CGDatabaseTool> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    await insertInitialModels();
  }

  Future<void> createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS diary_table (id INTEGER PRIMARY KEY AUTOINCREMENT, location TEXT,content TEXT ,createTime INT )');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS materials_table (id INTEGER PRIMARY KEY AUTOINCREMENT, amount DOUBLE ,name TEXT  ,createTime INT )');
  }

  Future<void> insertInitialModels() async {
    final hasData = CGSharedPreferences.getBool("has_initail_data") ?? false;
    if (hasData) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    final location = 'Daming Lake';
    final content = '''People's life, always constantly through the separation and reunion. Some people, will meet again after the high speed of time never stop, never stop, but always drag''';

    final diary = CGDiaryModel();
    diary.createTime = DateTime.now().millisecondsSinceEpoch;
    diary.location = location;
    diary.content = content;
    await insetDiaryModel(diary);

    final count = 8 + Random().nextInt(3);
    for (var i = 0; i < count; i++) {

      final memodel = CGMaterialsModel();
      memodel.name = faker.food.dish();
      memodel.amount = (10 + Random().nextInt(88)) + Random().nextDouble();

      await insetMaterialsModel(memodel);
    }
    CGSharedPreferences.putBool("has_initail_data", true);
    if (Get.isRegistered<DiaryPageController>()) {
      Get.find<DiaryPageController>().getAllDatas();
    }
  }

  Future<void> insetDiaryModel(CGDiaryModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.insert('diary_table', {
      'location': item.location,
      'content': item.content,
      'createTime': item.createTime,
    });
  }

  Future<void> insetMaterialsModel(CGMaterialsModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.insert('materials_table', {
      'name': item.name,
      'amount': item.amount,
      'createTime': item.createTime,
    });
  }

  Future<void> clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete('diary_table');
    await db.delete('materials_table');
  }

  Future<List<CGDiaryModel>> getAllDiary() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('diary_table', orderBy: 'id DESC');

    return result.map((e) => CGDiaryModel.fromJson(e)).toList();
  }

  Future<List<CGMaterialsModel>> getAllMaterialsModel() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('materials_table', orderBy: 'id DESC');

    return result.map((e) => CGMaterialsModel.fromJson(e)).toList();
  }
}
