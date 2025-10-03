import 'package:flutter/material.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedToy;

    return ListView(
      children: [
        ToyCard(toy: selectedToy),
        ListTile(
          title: Text("Name", style: TextStyle( fontWeight: FontWeight.bold),),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Name"
          ),
          // i need to add placeholder textd
        )
      ],
    );
  }
}