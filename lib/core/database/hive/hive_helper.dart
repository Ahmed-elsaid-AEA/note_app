import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper<T> {
  String boxName;

  HiveHelper(this.boxName);

  //?OPEN BOX
  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(boxName);
  } //?OPEN BOX

  Future<void> closeBox(Box<T> box) async {
    return await box.close();
  }

  Future<void> addValue({required String key, required T value}) async {
    Box<T> box = await openBox();
    try {
      await box.put(key, value);
    } finally {
      await closeBox(box);
    }
  }

  Future<bool> updateValue({required String key, required T value}) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);
      if (founded == true) {
        await box.put(key, value);
      }
    } finally {
      await closeBox(box);
    }
    return founded;
  }

  Future<bool> deleteValue({required String key}) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);
      if (founded == true) {
        await box.delete(key);
      }
    } finally {
      await closeBox(box);
    }
    return founded;
  }

  Future<T?> getValue({required String key}) async {
    Box<T> box = await openBox();
    T? data;

    try {
      data = await box.get(key);
    } finally {
      await closeBox(box);
    }
    return data;
  }

  Future<Map<dynamic, T?>> getAllData() async {
    Box<T> box = await openBox();

    Map<dynamic, T>? data;

    try {
      data = await box.toMap();
    } finally {
      await closeBox(box);
    }
    return data;
  }
}
