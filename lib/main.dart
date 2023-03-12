import 'package:flutter/material.dart';

import 'provider/counter_provider.dart';
import 'screens/counter_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: CounterExample()),
    );
  }
}
