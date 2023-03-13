// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/theme_provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Column(children: [
        Consumer<ThemeProvider>(builder: (context, value, child) {
          return RadioListTile<ThemeMode>(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme);
        }),
        Consumer<ThemeProvider>(builder: (context, value, child) {
          return RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme);
        }),
        Consumer<ThemeProvider>(builder: (context, value, child) {
          return RadioListTile<ThemeMode>(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme);
        }),
      ]),
    );
  }
}
