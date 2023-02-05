
import 'dart:convert';
import 'dart:typed_data';
import 'package:hive/hive.dart';

class StorageService {
  final encryptionKey = "744D2A54-E1ED-4FD2-8BFD-318782494787";
  late Uint8List encryptionKeyEncoded;
  late Future<Box> encryptedBox;

  StorageService () {
    encryptionKeyEncoded = base64Url.decode(encryptionKey);
    encryptedBox = Hive.openBox("sarafi_storage", encryptionCipher: HiveAesCipher(encryptionKeyEncoded));
  }

  Future<void> putString (String key, String value) async => await (await encryptedBox).put(key, value);

  Future<String> getString (String key) async => await (await encryptedBox).get(key);

}