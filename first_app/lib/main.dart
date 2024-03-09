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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
        ),
        body: Center(
          child: SizedBox(
            height : double.infinity,
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
                    onPressed: () {
                      setState(() {
                        buttonName = 'Clicked';
                      });
                    },
                    child: Text(buttonName),
                  ),
                ]),
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
