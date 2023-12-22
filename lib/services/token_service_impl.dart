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
    String? token = await storage.read(key: 'token');
    return token;
  }
}
