import 'package:flutter/material.dart';
import 'package:mobile_travel_app/app_data.dart';
import 'package:mobile_travel_app/models/trip.dart';
import 'package:mobile_travel_app/screens/category_trips_screen.dart';
import 'package:mobile_travel_app/screens/filter_screen.dart';

import 'package:mobile_travel_app/screens/tabs_screen.dart';
import 'package:mobile_travel_app/screens/trip_datails_sceens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = tripsData;
  List<Trip> _favoriteTrips = [];
  void _changeFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availableTrips = tripsData.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          tripsData.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel APP',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              titleLarge: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (context) =>
            CategoryTripsScreen(_availableTrips),
        TripDetails.screenRoute: (context) =>
            TripDetails(_manageFavorite, _isFovarite),
        FiltersScreen.screenRoute: (context) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
