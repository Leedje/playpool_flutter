import 'package:flutter/material.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var toys = context.watch<AppState>().wishlist;

    return GridView.count(
      crossAxisCount: 4,
      children: [
        ...toys.map((toy) => Card(
          child: Text(toy.name), 
        ))
      ],
    );
  }
}

//i wanna show it as a podium 