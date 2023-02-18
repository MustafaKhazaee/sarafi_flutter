
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class SecureStorage {
  static FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static putString (String key, String value) async {
    final containsEncryptionKey = await _secureStorage.containsKey(key: 'my_encryption_key');
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(key: 'my_encryption_key', value: base64UrlEncode(key));
    }
    final a = await _secureStorage.read(key: 'my_encryption_key');
    final encryptionKey = base64Url.decode(a!);
    final encryptedBox = await Hive.openBox('encryptedBox', encryptionCipher: HiveAesCipher(encryptionKey));
    await encryptedBox.put(key, value);
  }

  static getString (String key) async {
    final containsEncryptionKey = await _secureStorage.containsKey(key: 'my_encryption_key');
    if (!containsEncryptionKey) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(key: 'my_encryption_key', value: base64UrlEncode(key));
    }
    final a = await _secureStorage.read(key: 'my_encryption_key');
    final encryptionKey = base64Url.decode(a!);
    final encryptedBox = await Hive.openBox('encryptedBox', encryptionCipher: HiveAesCipher(encryptionKey));
    return await encryptedBox.get(key);
  }

}