import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/storage_constants.dart';

class StorageService {
  static StorageService? instance;

  factory StorageService() {
    if (instance == null) instance = StorageService._init();
    return instance!;
  }

  StorageService._init();
  late Box _storage;

  initStorage() async {
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);

    _storage = await Hive.openBox<dynamic>(StorageConstants.STORAGE);
  }

  setData(String key, dynamic data) {
    _storage.put(key, data);
  }

  dynamic getData(String key) {
    return _storage.get(key);
  }

  void removeKey(String key) {
    _storage.delete(key);
  }
}
