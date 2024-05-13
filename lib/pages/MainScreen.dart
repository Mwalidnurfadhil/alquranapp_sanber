import 'package:final_project_alquranapp/pages/AccountScreen.dart';
import 'package:final_project_alquranapp/pages/HomeScreen.dart';
import 'package:final_project_alquranapp/pages/JadwalSholatScreen.dart';
import 'package:final_project_alquranapp/pages/SurahScreen.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  static const List<Widget> _layoutPage = <Widget>[
    HomeScreen(),
    JadwalSholatSc(),
    SurahScreen(),
    AccountScreen(),
  ];
  void _onTabItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            title: Text("Sholat"),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            title: Text("Read Alquran"),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
            backgroundColor: Colors.teal,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.teal[900],
        onTap: _onTabItem,
      ),
    );
  }
}
