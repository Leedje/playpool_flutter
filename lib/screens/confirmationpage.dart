import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 240, 240),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Image(
              width: 140,
              height: 140,
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/5610/5610944.png',
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Your reservation was successfully made!',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'An email confirmation was sent along with your pickup code. \n Contact your local courrier for your toy’s pickup.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text('Close', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
