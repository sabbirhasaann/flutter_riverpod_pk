import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyticsService {
  void log(String event) {
    print(event);
  }
}

final analyticsProvider = Provider<AnalyticsService>((ref) {
  return AnalyticsService();
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('provider analytics provider', () {
    final analytics = container.read(analyticsProvider);
    expect(analytics, isA<AnalyticsService>());
  });

  test('button pressed', () {
    final analytics = container.read(analyticsProvider);
    analytics.log('Button Pressed');
    expect(analytics, isA<AnalyticsService>());
  });
}
