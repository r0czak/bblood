import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/front/home_page.dart';
import '/front/blood_card_page.dart';
import '/front/research_page.dart';
import '/front/map_page.dart';
import '/front/benefits_page.dart';


class MenuController extends StatefulWidget {
  const MenuController({Key? key}) : super(key: key);

  @override
  _MenuControllerState  createState() => _MenuControllerState();
}

class _MenuControllerState extends State<MenuController>{

  final PageController _pageController = PageController();
  final List<Widget> _screen = [HomeScreen(), BloodCardScreen(), MapScreen(), BenefitsScreen(), ResearchScreen()];

  int _selectedIndex = 0;
  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: TextStyle(fontSize: 11, color: _selectedIndex == 0 ? Colors.red : Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bloodtype,
              color: _selectedIndex == 1 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Krew",
              style: TextStyle(fontSize: 11, color: _selectedIndex == 1 ? Colors.red : Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: _selectedIndex == 2 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Punkty krwi",
              style: TextStyle(fontSize: 11, color: _selectedIndex == 2 ? Colors.red : Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.redeem,
              color: _selectedIndex == 3 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Zniżki",
              style: TextStyle(fontSize: 11, color: _selectedIndex == 3 ? Colors.red : Colors.grey,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt,
              color: _selectedIndex == 4 ? Colors.red : Colors.grey,
            ),
            title: Text(
              "Badania",
              style: TextStyle(fontSize: 11, color: _selectedIndex == 4 ? Colors.red : Colors.grey,),
            ),
          ),
        ],
      ),
    );
  }
}