import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/entities/auth_tokens.dart';

class SecureTokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _storage;

  SecureTokenStorage({required FlutterSecureStorage storage})
    : _storage = storage;

  Future<void> saveTokens({
    required AuthTokens tokens,
  }) async {
    await _storage.write(
      key: _accessTokenKey,
      value: tokens.accessToken,
    );

    await _storage.write(
      key: _refreshTokenKey,
      value: tokens.refreshToken,
    );
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  Future<void> clear() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
