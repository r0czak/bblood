import 'package:bblood/views/benefits_page.dart';
import 'package:bblood/views/blood_card_page.dart';
import 'package:bblood/views/home_page.dart';
import 'package:bblood/views/map_page.dart';
import 'package:bblood/views/research_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuController extends StatefulWidget {
  const MenuController({Key? key}) : super(key: key);

  @override
  _MenuControllerState createState() => _MenuControllerState();
}

class _MenuControllerState extends State<MenuController> {
  final PageController _pageController = PageController();
  final List<Widget> _screen = [
    const HomeScreen(),
    const BloodCardScreen(),
    const MapScreen(),
    const BenefitsScreen(),
    const ResearchScreen()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BeBold App"),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFDA4148),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 35.0,
                ),
              )
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Główna",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 0 ? Colors.red : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bloodtype,
              color: _selectedIndex == 1 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Krew",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 1 ? Colors.red : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: _selectedIndex == 2 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Punkty krwi",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 2 ? Colors.red : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.redeem,
              color: _selectedIndex == 3 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Zniżki",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 3 ? Colors.red : Colors.grey,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
              color: _selectedIndex == 4 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Badania",
              style: TextStyle(
                fontSize: 11,
                color: _selectedIndex == 4 ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
