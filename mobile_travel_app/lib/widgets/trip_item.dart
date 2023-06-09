// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/trip_datails_sceens.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const TripItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season});

  void selectTrip(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(TripDetails.screenRoute, arguments: id)
        .then((result) {
      if (result != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: [0.7, 1],
                )),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.today),
                    SizedBox(width: 6),
                    Text('$duration days'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.sunny),
                    SizedBox(width: 6),
                    Text(season.name),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.family_restroom),
                    SizedBox(width: 6),
                    Text(tripType.name),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
