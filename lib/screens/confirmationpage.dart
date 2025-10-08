import 'package:flutter/material.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //set the size properties here 
          // check how big the container is in watch mode.
          child: Image(image: NetworkImage('url')),
        ),
        SizedBox(height: 15),
        Text(
          'Your reservation was successfully made!',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'An email confirmation was sent along with your pickup code. \n Contact your local courrier for your toy’s pickup.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
