import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedIndex = ref.watch(selectedColorProvider);

    return RadioGroup<int>(
      groupValue: selectedIndex,
      onChanged: (value) {
        if (value == null) return;
        ref.read(selectedColorProvider.notifier).state = value;
      },
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile<int>(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.toARGB32()}'),
            activeColor: color,
            value: index,
          );
        },
      ),
    );
  }
}
