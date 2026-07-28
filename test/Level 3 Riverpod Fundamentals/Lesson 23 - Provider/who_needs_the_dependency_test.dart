import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  final String baseUrl;
  ApiClient(this.baseUrl);
}

class ProductRepository {
  final ApiClient apiClient;
  ProductRepository(this.apiClient);
}

class AppConfig {
  final String environment;
  AppConfig({
    required this.environment,
  });
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient("base_url:://...");
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProductRepository(apiClient);
});

final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig(environment: "local");
});

final greetingProvider = Provider<String>((ref) {
  return "Hello Riverpod";
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('apiClient Provider shoule provide ApiClient()', () {
    final client = container.read(apiClientProvider);
    print(client);
    expect(client, isA<ApiClient>());
  });

  test('productRepositoryProvider should provide ProductRepository', () {
    final repository = container.read(productRepositoryProvider);
    print(repository);
    expect(repository, isA<ProductRepository>());
  });

  test('appConfigProvider should provide AppConfig', () {
    final config = container.read(appConfigProvider);
    print(config);
    expect(config, isA<AppConfig>());
  });

  test('greeting Provider should provider "Hello Riverpod"', () {
    final greet = container.read(greetingProvider);
    print(greet);
    expect(greet, "Hello Riverpod");
  });
}
