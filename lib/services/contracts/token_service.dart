abstract class TokenService {
  Future<void> storeToken(String token);
  Future<String?> retrieveToken();
}
