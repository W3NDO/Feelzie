import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class LocalStorageService {
  static openBox(String boxName) async {
    Box box = await Hive.openBox(boxName);
    return box;
  }

  static openLazyBox(String boxName) async {
    LazyBox<Box> box = await Hive.openLazyBox(boxName);
    return box;
  }

  static closeBox(String boxName) {
    Hive.box(boxName).close();
  }
}

// how to model the stored records
// store by date
