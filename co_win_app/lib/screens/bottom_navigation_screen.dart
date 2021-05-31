import 'package:co_win_app/screens/detailed_stat_screen.dart';
import 'package:co_win_app/screens/home_screen.dart';
import 'package:co_win_app/screens/symtomps_screen.dart';
import 'package:co_win_app/screens/vaccine_screen.dart';
import 'package:co_win_app/shared/colors.dart';
import 'package:co_win_app/shared/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  set onPageChanged(index) => _onPageChanged(index);
  void _onPageChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: subtitlelabelStyle,
          unselectedLabelStyle: titlelabelStyle,
          selectedIconTheme: IconThemeData(color: primarySwatchColor),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.list_ui_alt),
              label: "Details",
            ),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.plus_square), label: "Stats"),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.list_ul), label: "Symtopms")
          ],
          onTap: (index) => setState(() {
            _onPageChanged(index);
            pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn);
          }),
          selectedItemColor: Colors.blueGrey,
          currentIndex: _selectedIndex,
        ),
        body: PageView(
          controller: pageController,
          children: [HomeScreen(), DetailedStat(), SymtompsScreen()],
          onPageChanged: (index) => _onPageChanged(index),
        ),
      ),
    );
  }
}
