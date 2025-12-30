import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);
