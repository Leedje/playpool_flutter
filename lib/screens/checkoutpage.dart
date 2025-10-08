import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/models/reservationmodel.dart';
import 'package:playpool_flutter/viewmodels/appState.dart';
import 'package:playpool_flutter/widgets/toyCard.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  final String toyId;

  const CheckoutPage({required this.toyId});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  ReservationModel reservation = ReservationModel(); 
  final _formKey = GlobalKey<_CheckoutPageState>();

  @override
  Widget build(BuildContext context) {
    final toy = context.watch<AppState>().getToyById(widget.toyId);
    final appContext = context.watch<AppState>();
    
    return Container(
      alignment: AlignmentGeometry.center,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToyCard(toy: toy),
            TextFormField(initialValue: reservation.name, decoration: InputDecoration(hintText: 'Name')),
            TextFormField(
              decoration: InputDecoration(hintText: 'Reservation Dates'),
              // should be a selector and the values should be set to the reservation model
            ), 
              
            TextFormField(initialValue: reservation.address, decoration: InputDecoration(hintText: 'Address')),
              
            DropdownButtonFormField(
              items: List.generate(5, (int index) {
                return DropdownMenuItem(child: Text('Location $index'));
              }),
              onChanged: (location) {
                reservation.dropoff_pickuplocation = location;
              },
              validator: (location) {
                if (location == null){
                  return 'Please select a dropoff and pickup location.';
                }
              },
            ),
            FilledButton(onPressed: () {
               // if the form is still validating, show a snackbar , else show the screen
               appContext.submitReservation(reservation);
               context.go('/confirmationscreen');
            }, 
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFFFFC943)
            ),
            child: Text('Confirm Reservation'))
          ],
        ),
      ),
    );
  }
}