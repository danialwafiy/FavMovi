import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:favmovi/screen/favourite.dart';
import 'package:favmovi/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:favmovi/style/theme.dart' as Style;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Style.Colors.mainColor,
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              HomeScreen(),
              FavouriteScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Style.Colors.mainColor,
          mainAxisAlignment: MainAxisAlignment.center,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home', style: TextStyle(color: Colors.white)),
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                activeColor: Colors.blueGrey[900],
                inactiveColor: Colors.white),
            BottomNavyBarItem(
                title: Text('Favourites', style: TextStyle(color: Colors.white)),
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                activeColor: Colors.blueGrey[900],
                inactiveColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
