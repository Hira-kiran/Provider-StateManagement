// ignore_for_file: file_names

import 'package:flutter/material.dart';

class StatelessWid extends StatelessWidget {
  StatelessWid({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statefull Widget"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Center(
                    child: Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 20),
                ));
              },
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
