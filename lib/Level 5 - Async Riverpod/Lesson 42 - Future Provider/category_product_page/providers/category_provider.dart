import 'package:flutter_riverpod/legacy.dart';
import '../models/category_enum.dart';

final categoryProvider = StateProvider<Category>((ref) {
  return Category.all;
});
