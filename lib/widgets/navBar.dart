import 'package:flutter/material.dart';
import 'package:untitled/homeScreen.dart';
import 'package:untitled/profileScreen.dart';
import 'package:untitled/productScreen.dart';

// import '../loginScreen.dart';
// import '../registerScreen.dart';
// import '../welcomScreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  List screens = [const HomeScreen(),const ProductScreen(),ProfileScreen(),];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        //backgroundColor: Color(0xff44BCCF),
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 33, 113, 128),
        unselectedItemColor: const Color(0xFF44BCCF),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Home"),
        ],
      ),
    );
  }
}