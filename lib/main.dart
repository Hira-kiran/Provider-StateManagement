import 'package:flutter/material.dart';
import 'package:provider_statemanagement/provider/fav_provider.dart';
import 'package:provider_statemanagement/provider/opacity_provider.dart';

import 'provider/counter_provider.dart';
import 'package:provider/provider.dart';

import 'screens/favoriteApp/fav_screen.dart';

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
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: FavoriteExample()),
    );
  }
}
