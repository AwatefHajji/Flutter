import 'package:flutter/material.dart';
import 'package:mobile_travel_app/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  Widget buildListTile(String title, IconData icon, VoidCallback onTapFct) {
    return ListTile(
      leading: Icon(icon, size: 30, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Lora', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapFct,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text(
            ' Travel Guide',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        SizedBox(height: 20),
        buildListTile("Trips", Icons.card_travel, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile("Filtred", Icons.filter_list, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
        }),
      ]),
    );
  }
}
