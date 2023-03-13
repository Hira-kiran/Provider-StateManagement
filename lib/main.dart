import 'package:flutter/material.dart';
import 'package:provider_statemanagement/provider/fav_provider.dart';
import 'package:provider_statemanagement/provider/login_provider.dart';
import 'package:provider_statemanagement/provider/opacity_provider.dart';
import 'provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => OpacityProvider()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            debugShowCheckedModeBanner: false,
            home: const LoginScreen());
      }),
    );
  }
}
