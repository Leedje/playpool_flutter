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
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),

              //Start Form
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
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
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(border: InputBorder.none),
                          hint: Text('Select Dropoff/Pickup Location'),
                          isExpanded: true,
                          initialValue: reservation.dropoff_pickuplocation,
                          items: List.generate(5, (int index) {
                            final location = 'Location $index';
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }),
                          onChanged: (location) {
                            setState(() {
                              reservation.dropoff_pickuplocation = location;
                            });
                          },
                          validator: (location) {
                            if (location == null) {
                              return 'Please select a dropoff and pickup location.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && appContext.submitReservation(reservation)) {
                          context.replace('/confirmationscreen');
                        }
                        else {
                          // stay on the screen and display missing fields
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
            //End Form

            /// Top-left back button
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  label: Text('Back', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
