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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final toy = context.watch<AppState>().getToyById(widget.toyId);
    final appContext = context.watch<AppState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 234, 234),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SafeArea(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 3,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ToyCard(toy: toy),
                  Card(
                    color: Colors.white,
                    child: TextFormField(
                      initialValue: reservation.name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Reservation Dates',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      // should be a selector and the values should be set to the reservation model
                    ),
                  ),

                  Card(
                    color: Colors.white,
                    child: TextFormField(
                      initialValue: reservation.address,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        hint: Text('Select Dropoff/Pickup Location'),
                        isExpanded: true,
                        initialValue: reservation.dropoff_pickuplocation,
                        items: List.generate(5, (int index) {
                          return DropdownMenuItem(
                            alignment: AlignmentGeometry.centerLeft,
                            value: 'Location $index',
                            child: Text(
                              'Location $index',
                              textAlign: TextAlign.start,
                            ),
                          );
                        }),
                        onChanged: (location) {
                          setState(() {
                            reservation.dropoff_pickuplocation = location
                                .toString();
                          });
                        },
                        validator: (location) {
                          if (location == null) {
                            return 'Please select a dropoff and pickup location.';
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        appContext.submitReservation(reservation);
                        context.go('/confirmationscreen');
                      } else {
                        //show snack bar or error modal if needed
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFFFFC943),
                    ),
                    child: Text('Confirm Reservation'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
