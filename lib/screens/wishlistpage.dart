import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var wishlistToys = null; //should be context.wishlist

    return GridView.count(
      crossAxisCount: 4,
    );
  }
}