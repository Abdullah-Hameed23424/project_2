import 'package:flutter/material.dart';
import 'package:project_2/core/constants/app_colors.dart';
import 'package:project_2/core/localization/language_constraints.dart';
import 'package:project_2/modules/home/view/screens/home_screen.dart';
import 'package:project_2/modules/orders/view/screens/close_order_screen.dart';
import 'package:project_2/modules/orders/view/screens/orders_screen.dart';
import 'package:project_2/modules/profile/view/screens/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBarScreen extends StatefulWidget {
  final int? index;
  const NavBarScreen({super.key, this.index = 0});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const CloseOrderScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset.zero),
        ],
      ),
      child: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        items: <SalomonBottomBarItem>[
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: Text(translate('nav.home_title', context)),
            selectedColor: AppColors.primary,
            unselectedColor: Colors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: Text(translate('nav.my_orders_title', context)),
            selectedColor: AppColors.primary,
            unselectedColor: Colors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.wallet_outlined),
            title: Text(translate('nav.wallet_title', context)),
            selectedColor: AppColors.primary,
            unselectedColor: Colors.grey,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: Text(translate('nav.profile_title', context)),
            selectedColor: AppColors.primary,
            unselectedColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
