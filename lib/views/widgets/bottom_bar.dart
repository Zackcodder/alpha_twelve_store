import 'package:alpha_twelve_store/core/constants/string.dart';
import 'package:alpha_twelve_store/views/screens/cart_screen.dart';
import 'package:alpha_twelve_store/views/screens/favourite_screen.dart';
import 'package:alpha_twelve_store/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../viewmodels/cart_provider.dart';
import '../screens/home_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  bool showFloatMenu = false;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        color: kcWhite,
        shape: const CircularNotchedRectangle(),
        notchMargin: 18.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(ksHome, 0, "assets/svgs/homeIcon.svg"),
            _buildNavItem(ksCart, 1, "assets/svgs/cartIcon.svg"),
            _buildNavItem(ksFavourite, 2, "assets/svgs/favoIcon.svg"),
            _buildNavItem(ksProfile, 3, "assets/svgs/profileIcon.svg"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, int index, String iconImage) {
    Color color = _selectedIndex == index ? kcWhite : kcBlack;
    Color containerColor =
        _selectedIndex == index ? kcNavIconBlue : Colors.transparent;
    Color labelColor = _selectedIndex == index ? kcNavIconBlue : kcBlack;

    final isCart = label.toLowerCase() == 'cart';
    final cartCount = context.watch<CartViewModel>().totalItems;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: containerColor,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ///icon image
                SvgPicture.asset(
                  iconImage,
                  height: 24,
                  width: 24,
                  color: color,
                ),

                /// condition for showing cart number bag
                if (isCart && cartCount > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ///icon label
          Text(label, style: TextStyle(color: labelColor)),
        ],
      ),
    );
  }
}
