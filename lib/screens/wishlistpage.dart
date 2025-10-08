import 'package:flutter/material.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyBall.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var toys = context.watch<AppState>().wishlist;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://www.shutterstock.com/image-vector/background-symbols-newborn-baby-light-260nw-371026643.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 4,
              children: toys.map((toy) {
                return ToyBall(toy: toy, scale: 1, onTap: () {});
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
