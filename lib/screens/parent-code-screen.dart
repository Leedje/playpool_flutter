import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ParentVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 220, 203),
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: Colors.amber),
    );

    return Container(
      color: Color(0xFFFFECBD),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            defaultPinTheme: defaultPinTheme,
            submittedPinTheme: submittedPinTheme,
            onCompleted: (pin) => print(pin),
            validator: (code) {
              if (code == '1234') {
                context.go('/requests');
              } else {
                for (int i = 3; i > 0; i--) {
                  //context.go('/');
                  return code == '1234' ? "null" : 'Pin is incorrect. \n ${i} attepts left.';
                }
              }

              //on success, context.go('/requests')
              // if it doesn't succeed 3 times (display attempts left), then it goes to the wishlist page
              //a popup says parent has been notified of this attempt.
            },
          ),
        ],
      ),
    );
  }
}
