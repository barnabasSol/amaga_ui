import 'dart:convert';
import 'package:amaga/services/contracts/token_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenServiceImpl implements TokenService {
  final storage = const FlutterSecureStorage();

  @override
  Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  @override
  Future<String?> retrieveToken() async {
    return await storage.read(key: 'token');
  }

  Map<String, dynamic> parseToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload = parts[1];
    final normalizedPayload = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalizedPayload));
    final payloadMap = json.decode(resp);
    return payloadMap;
  }
}
