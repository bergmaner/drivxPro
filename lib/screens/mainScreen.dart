import 'package:drivxpro/components/Button.dart';
import 'package:drivxpro/tabs/earningsTab.dart';
import 'package:drivxpro/tabs/homeTab.dart';
import 'package:drivxpro/tabs/profileTab.dart';
import 'package:drivxpro/tabs/ratingsTab.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  TabController tabController;
  int selectedIndex = 0;

  void handleClick(int index){
    print("xdd");
    setState(() {
      selectedIndex = index;
      tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          HomeTab(),
          EarningsTab(),
          RatingsTab(),
          ProfileTab(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        unselectedItemColor: Color(0xFF666666),
        selectedItemColor: Color(0xfff00000),
        selectedLabelStyle: TextStyle(fontSize: 13),
        onTap: handleClick,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "Earnings"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Ratings"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account"
          ),
        ],
      ),
    );
  }
}
