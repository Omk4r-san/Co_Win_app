import 'package:co_win_app/screens/detailed_stat_screen.dart';
import 'package:co_win_app/screens/home_screen.dart';
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

  // List<Widget> _widgetOptions = <Widget>[
  //   NotePage(title: "Notes", trailingIcon: UniconsLine.angle_right_b),
  //   AddNotesPage(),
  //   NotePage(title: "Notes", trailingIcon: UniconsLine.repeat)
  // ];
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
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(UniconsLine.graph_bar),
            Icon(UniconsLine.info_circle, size: 30),
            Icon(UniconsLine.syringe),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: containerColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _onPageChanged(index);
              pageController.animateToPage(_selectedIndex,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn);
            });
          },
          letIndexChange: (index) => true,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedLabelStyle: subtitlelabelStyle,
        //   unselectedLabelStyle: titlelabelStyle,
        //   selectedIconTheme: IconThemeData(color: primarySwatchColor),
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(UniconsLine.graph_bar),
        //       label: "News",
        //     ),
        //     BottomNavigationBarItem(
        //         icon: Icon(UniconsLine.syringe), label: "Add"),
        //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Trash")
        //   ],
        //   onTap: (index) => setState(() {
        //     _onPageChanged(index);
        //     pageController.animateToPage(_selectedIndex,
        //         duration: Duration(milliseconds: 200),
        //         curve: Curves.fastOutSlowIn);
        //   }),
        //   selectedItemColor: Colors.blueGrey,
        //   currentIndex: _selectedIndex,
        // ),
        body: PageView(
          controller: pageController,
          children: [
            HomeScreen(),
            DetailedStat(),
            HomeScreen(),
          ],
          onPageChanged: (index) => _onPageChanged(index),
        ),
      ),
    );
  }
}
