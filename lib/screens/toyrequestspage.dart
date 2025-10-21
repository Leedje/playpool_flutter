import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/confirmedToyCard.dart';
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
    var confirmedReservations = context.watch<AppState>().confirmedReservations; 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: ListView(
        padding: EdgeInsets.all(8),
        children:
        [
          //Confirmed Toys
          if(confirmedReservations.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirmed Reservations', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    ...confirmedReservations.map((res) => Column(
                      children: [
                        ConfirmedToyCard(reservation: res)
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 20,)

            ],)
            
            else 
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('No reservations made yet.', textAlign: TextAlign.center,),
               )
               ,
            
          
          //Requested Toys
          if (requestedToys.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Requested Toys', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5),
              ...requestedToys.map((toy) => Column(
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
              ),],),),
            ],
          )
          else 
          Padding(padding: 
          EdgeInsets.all(35),
          child: Text('No toys requested yet.', textAlign: TextAlign.center,),
          ),
        ],

          ),
      );
  }
}
