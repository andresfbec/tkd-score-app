import 'package:cryptography/cryptography.dart';
import 'dart:convert';
import 'dart:math';

Future<String> hashPassword(String password) async {
  final algorithm = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: 100000,
    bits: 256,
  );

  final salt = List<int>.generate(16, (_) => Random.secure().nextInt(256));

  final secretKey = SecretKey(utf8.encode(password));

  final derivedKey = await algorithm.deriveKey(
    secretKey: secretKey,
    nonce: salt,
  );

  final hashBytes = await derivedKey.extractBytes();

  return [
    'pbkdf2_sha256',
    '100000',
    base64Encode(salt),
    base64Encode(hashBytes),
  ].join('\$');
}

Future<bool> verifyPassword(String inputPassword, String storedPassword) async {
  final parts = storedPassword.split('\$');

  if (parts.length != 4) return false;

  final algorithmName = parts[0];
  final iterations = int.parse(parts[1]);
  final salt = base64Decode(parts[2]);
  final storedHash = parts[3];

  if (algorithmName != 'pbkdf2_sha256') return false;

  final algorithm = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: iterations,
    bits: 256,
  );

  final secretKey = SecretKey(utf8.encode(inputPassword));

  final derivedKey = await algorithm.deriveKey(
    secretKey: secretKey,
    nonce: salt,
  );

  final newHash = base64Encode(await derivedKey.extractBytes());

  return newHash == storedHash;
}
