import 'package:flutter/material.dart';
import 'package:newsmax/presentation/home_screen.dart';
import 'package:newsmax/presentation/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int screenIndex = 0;
  var screens = [HomeScreen(), SearchScreen()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsMax',
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[screenIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          enableFeedback: true,
          currentIndex: screenIndex,
          onTap: (value) {
            setState(() {
              screenIndex = value;
            });
          },
        ),
      ),
    );
  }
}
