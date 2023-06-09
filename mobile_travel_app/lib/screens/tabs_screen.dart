//APP BAR IN THE TOP OF SCREEN
// import 'package:flutter/material.dart';
// import 'package:mobile_travel_app/screens/categories_screen.dart';
// import 'package:mobile_travel_app/screens/favorites_screens.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Travel App'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'Dashboard',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ]),
//       ),
//     );
//   }
// }
// APP BAR -> BUTTON ->
import 'package:flutter/material.dart';
import 'package:mobile_travel_app/screens/categories_screen.dart';
import 'package:mobile_travel_app/screens/favorites_screens.dart';
import 'package:mobile_travel_app/widgets/app_drawer.dart';

import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  TabsScreen(this.favoriteTrips);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenInd = index;
    });
  }

  int _selectedScreenInd = 0;
  late List<Map<String, Widget>> _screens;
  @override
  void initState() {
    _screens = [
      {"screen": CategoriesScreen(), "title": Text("Categories")},
      {
        "screen": FavoritesScreen(widget.favoriteTrips),
        "title": Text("Favorites")
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedScreenInd]["title"],
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenInd]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).focusColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenInd,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
