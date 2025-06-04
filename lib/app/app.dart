import 'package:flutter/material.dart';

import '../core/constants/string.dart';
import '../views/screens/cart_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/product_details_screen.dart';
import '../views/widgets/bottom_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ksAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavbar(),
        '/cart': (context) => const CartScreen(),
        '/home': (context) => const HomeScreen(),
        '/product': (context) => const ProductDetailScreen(),
      },
    );
  }
}
