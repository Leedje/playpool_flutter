import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      color: const Color.fromARGB(255, 236, 234, 234),
      child: ListView(
        children: requestedToys.map((toy) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ToyCard(toy: toy),
              Row(
                spacing: 10,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      appContext.declineRequest(toy.id);
                      // Display toy removed notification
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFFFFC943),
                      ),
                    ),
                    child: const Text(
                      "Decline Request",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      context.push('/toycheckout/${toy.id}');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC943),
                    ),
                    child: const Text(
                      "Accept Request",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
