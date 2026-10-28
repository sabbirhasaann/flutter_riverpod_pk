import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/product_notifier.dart';
import '../notifiers/product_state.dart';

final productNotifierProvider =
    NotifierProvider<ProductNotifier, ProductState>(ProductNotifier.new);
