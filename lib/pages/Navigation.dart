import 'package:bokchoydoctor/pages/AboutUs.dart';
import 'package:bokchoydoctor/pages/Calculate.dart';
import 'package:bokchoydoctor/pages/FAQ.dart';
import 'package:bokchoydoctor/pages/Scanner1.dart';
import 'package:bokchoydoctor/pages/SettingsPage.dart';
import 'package:bokchoydoctor/pages/HomeScreen.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, Key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Navigation> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pechay Doctor",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 98, 218, 18),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/plantbg.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Pechay Doctor',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                setState(() {
                  _page = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_information),
              title: const Text('Pechay Doctor Scanner'),
              onTap: () {
                setState(() {
                  _page = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Treatment Calculation'),
              onTap: () {
                setState(() {
                  _page = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('About Us'),
              onTap: () {
                setState(() {
                  _page = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('FAQ'),
              onTap: () {
                setState(() {
                  _page = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  _page = 5;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: getPage(_page),
    );
  }

  Widget getPage(int page) {
    switch (page) {
      case 0:
        return const HomeWidget();
      case 1:
        return const Scanner1();
      case 2:
        return const Calculate();
      case 3:
        return const AboutUs();
      case 4:
        return const FAQ();
      case 5:
        return const SettingsPage();
      default:
        return Container(); // Default page, you can replace it with another widget.
    }
  }
}
