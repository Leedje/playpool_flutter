import 'package:go_router/go_router.dart';
import 'package:playpool_flutter/layouts/app_scaffold.dart';
import 'package:playpool_flutter/screens/checkoutpage.dart';
import 'package:playpool_flutter/screens/confirmationpage.dart';
import 'package:playpool_flutter/screens/homepage.dart';
import 'package:playpool_flutter/screens/toyrequestspage.dart';
import 'package:playpool_flutter/screens/parent-code-screen.dart';
import 'package:playpool_flutter/screens/wishlistpage.dart';

final appRouter = GoRouter(
  initialLocation: '/', 
   routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/wishlist',
          builder: (context, state) => WishlistPage(),
        ),
        GoRoute(
          path: '/verification', 
          builder: (context, state) => ParentVerificationScreen(),
        ),
        GoRoute(
          path:
              '/requests', 
          builder: (context, state) => ToyRequestsPage(),
        ),
        GoRoute(path: '/toycheckout/:toyid', builder: (context, state) {
          final id = state.pathParameters['toyid']!;
          return CheckoutPage(toyId: id);
        }),
        GoRoute(path: '/confirmationscreen', builder: (context, state) => ConfirmationPage(),)
      ],
    ),
  ],
);