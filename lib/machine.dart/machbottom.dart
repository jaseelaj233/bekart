import 'package:bekart/events.dart';
import 'package:bekart/machine.dart/machhome.dart';
import 'package:bekart/machine.dart/profilepage,dart';
import 'package:bekart/machine.dart/settings.dart';
// Fixed typo in import
import 'package:flutter/material.dart';

class Machbottom extends StatefulWidget {
  const Machbottom({super.key});

  @override
  State<Machbottom> createState() => _MachbottomState();
}

class _MachbottomState extends State<Machbottom> {
  int selectedIndex = 0; // Define selectedIndex to track the current page

  // List of pages to display
  final List<Widget> pages = [
    Machhome(),
    ProfilePage(),
    SettingsPage(),
  ];

  // Method to handle bottom navigation item tap
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 154, 94),
      body: pages[
          selectedIndex], // Display the current page based on selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Home',
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            tooltip: 'Profile',
            label: '',
            icon: Icon(Icons.person), // Changed to person for profile
          ),
          BottomNavigationBarItem(
            tooltip: 'Events',
            label: '',
            icon: Icon(Icons.event_seat),
          ),
        ],
        onTap: onItemTapped, // Handle navigation
        currentIndex: selectedIndex, // Highlight the selected item
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false, // Hide labels
      ),
    );
  }
}
