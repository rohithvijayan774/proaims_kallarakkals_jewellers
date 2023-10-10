import 'package:flutter/material.dart';
import 'package:proaims_test/const.dart';
import 'package:proaims_test/screens/home_screen.dart';
import 'package:proaims_test/screens/my_packages.dart';
import 'package:proaims_test/screens/profile.dart';
import 'package:proaims_test/screens/wallet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const MyPackages(),
    const Wallet(),
    const Profile(),
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel_outlined), label: 'MY PACKAGES'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'WALLET'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'PROFILE'),
        ],
        currentIndex: selectedIndex,
        onTap: onTap,
        backgroundColor: brownColor,
      ),
    );
  }
}
