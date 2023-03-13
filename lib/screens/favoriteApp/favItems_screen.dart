// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/fav_provider.dart';

class FavoriteItemsScreen extends StatefulWidget {
  const FavoriteItemsScreen({super.key});

  @override
  State<FavoriteItemsScreen> createState() => _FavoriteItemsScreenState();
}

class _FavoriteItemsScreenState extends State<FavoriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    print("object");
    final favProvider = Provider.of<FavProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite Items"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favProvider.emptyList.length,
                itemBuilder: (context, index) {
                  return Consumer<FavProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.emptyList.contains(index)) {
                          value.removeItems(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text(value.fastFood[index].toString()),
                      trailing: Icon(value.emptyList.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
