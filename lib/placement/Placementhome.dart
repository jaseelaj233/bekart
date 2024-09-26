import 'package:bekart/placement/form.dart';
import 'package:bekart/placement/view.dart';
import 'package:flutter/material.dart';

class Placementhome extends StatefulWidget {
  const Placementhome({super.key});

  @override
  State<Placementhome> createState() => _PlacementhomeState();
}

class _PlacementhomeState extends State<Placementhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 1, 1),
      appBar: AppBar(
        title: Text('home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('drawer place')),
            ListTile(
              leading: Icon(Icons.settings_accessibility),
              title: Text('terms and contition'),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('privacy polysi'),
            ),
            ListTile(
              leading: Icon(Icons.share_arrival_time),
              title: Text('shear'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('logout'),
            )
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Formpage(),
                    ));
                  },
                  child: Text('add'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 191, 31, 31),
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  )),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => dataFromFireStore(),
                    ));
                  },
                  child: Text('view'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 191, 31, 31),
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              tooltip: 'home', label: 'Home', icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
            tooltip: 'notification',
            label: 'notification',
            icon: Icon(Icons.notification_add),
          ),
          const BottomNavigationBarItem(
              tooltip: 'message', label: 'message', icon: Icon(Icons.message)),
        ],
      ),
    );
  }
}
