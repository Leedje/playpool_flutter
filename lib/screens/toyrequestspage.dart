import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/models/toyDTO.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class ToyRequestsPage extends StatefulWidget {
  @override
  State<ToyRequestsPage> createState() => _ToyRequestsPageState();
}

class _ToyRequestsPageState extends State<ToyRequestsPage> {
  void onPressed() {}
  @override
  Widget build(BuildContext context) {
    var appContext = context.watch<AppState>();
    var requestedToys = context.watch<AppState>().requestedToys;

    return Container(
      color: const Color.fromARGB(255, 219, 219, 219),
      child: ListView(
        children: [
          ...requestedToys.map((toy) => ToyCard(toy: toy)),
          Row(
            spacing: 10,
            children: [
              OutlinedButton(
                onPressed: () {
                  appContext.declineRequest("ToyID 1");
                  //Display toy removed notification
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(width: 2, color: Color(0xFFFFC943)),
                ),
                child: Text(
                  "Decline Request",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              FilledButton(
                onPressed: () {
                  //Accept request: Forward to confirmation page and push the toy object into the view
                  context.go('/toycheckout');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xFFFFC943),
                ),
                child: Text(
                  "Accept Request",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
