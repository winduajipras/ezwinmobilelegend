import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:ezwinmobilelegend/screens/account.dart';
import 'package:ezwinmobilelegend/screens/home.dart';
import 'package:ezwinmobilelegend/screens/news.dart';
import 'package:ezwinmobilelegend/styles/app_colors.dart';
import 'package:ezwinmobilelegend/styles/text_styles.dart';
import 'package:ezwinmobilelegend/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const NewsScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            unselectedIconTheme: const IconThemeData(color: AppColors.navy),
            selectedFontSize: 20,
            selectedIconTheme: const IconThemeData(color: AppColors.lime),
            selectedItemColor: AppColors.lime,
            selectedLabelStyle: KTextStyle.bottomNavigationBarSelectedTextStyle,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          ),
        ),
        GetBuilder<AuthController>(
          builder: (controller) =>
              controller.isLoading ? const Loading() : Container(),
        ),
      ],
    );
  }
}
