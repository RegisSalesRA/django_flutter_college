import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class StorageItem {
  StorageItem(this.key, this.value);

  final String key;
  final String value;
}

class StorageService {
  final secureStorage = const FlutterSecureStorage();
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

Future<void> writeSecureData(StorageItem newItem) async {
  await StorageService().secureStorage.write(
      key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
}

Future<String?> readSecureData(String key) async {
  var readData = await StorageService()
      .secureStorage
      .read(key: key, aOptions: _getAndroidOptions());
  return readData;
}

Future<void> deleteSecureData(StorageItem item) async {
  await StorageService()
      .secureStorage
      .delete(key: item.key, aOptions: _getAndroidOptions());
}

Future<bool> containsKeyInSecureData(String key) async {
  var containsKey = await StorageService()
      .secureStorage
      .containsKey(key: key, aOptions: _getAndroidOptions());
  return containsKey;
}

Future<List<StorageItem>> readAllSecureData() async {
  var allData = await StorageService()
      .secureStorage
      .readAll(aOptions: _getAndroidOptions());
  List<StorageItem> list =
      allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
  return list;
}
