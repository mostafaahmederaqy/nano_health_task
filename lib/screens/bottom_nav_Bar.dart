import 'package:flutter/material.dart';
import 'package:nano_health_task/screens/products_screen.dart';
import 'package:nano_health_task/screens/profile_screen.dart';

import 'cart_screen.dart';
import 'favourites_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    ProductsScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: ''
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ''
        ),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
