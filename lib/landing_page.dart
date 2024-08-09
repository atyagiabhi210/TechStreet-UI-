import 'package:tech_street/features/cart/page/cart_page.dart';
import 'package:tech_street/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:tech_street/features/favourites/page/favourite_page.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const FavouritePage(),
    const Center(
      child: Text('Profile Page'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('TechStreet'),
      ),
      bottomNavigationBar: WaterDropNavBar(
        waterDropColor: Theme.of(context).colorScheme.primary,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: Icons.shopping_bag,
            outlinedIcon: Icons.shopping_bag_outlined,
          ),
          BarItem(
              filledIcon: Icons.favorite,
              outlinedIcon: Icons.favorite_border_outlined),
          BarItem(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_outlined,
          ),
        ],
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: screens[selectedIndex],
    );
  }
}
