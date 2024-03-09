import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click';
  int bottomNavBarItemIndex = 0;
  bool _isCLicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
        ),
        body: Center(
          child: bottomNavBarItemIndex == 0
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonName = 'Clicked';
                            });
                          },
                          child: Text(buttonName),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            setState(() {
                              buttonName = 'Clicked';
                            });
                          },
                          child: Text(buttonName),
                        ),
                      ]),
                )
              : GestureDetector(
                  child: _isCLicked
                      ? Image.asset('images/srodowanoc.jpg')
                      : Image.network(
                          'https://images.photowall.com/products/70946/aurora-borealis-northern-lights.jpg?h=699&q=85'),
                  onTap: () {
                    setState(() {
                      _isCLicked = !_isCLicked;
                    });
                  },
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
          currentIndex: bottomNavBarItemIndex,
          onTap: (int index) {
            setState(() {
              bottomNavBarItemIndex = index;
            });
          },
        ),
      ),
    );
  }
}
