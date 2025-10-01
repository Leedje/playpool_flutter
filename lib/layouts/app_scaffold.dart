import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const AppScaffold({required this.child, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlayPool'), backgroundColor: Colors.amber, ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index){
            case 0:
            context.go('/');
            break;
            case 1: context.go('/wishlist');
            break;
            case 2: context.go('/verification');
            break;
            default:
            throw UnimplementedError('no widget for $index');
            //change this to a 404 page
          }
            },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.forward_to_inbox_rounded), label: 'My Requests'),

        ],
      ),
      backgroundColor: const Color.fromARGB(255, 208, 255, 255),
    );
  }
}
