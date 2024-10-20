import 'package:BabBBu/ui/widgets/common/navigation.dart';
import 'package:flutter/material.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/map_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    MapScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: AppNavigationBar(
          currentIndex: _currentIndex,
          onTabTapped: onTabTapped,
        ),
      ),
    );
  }
}
