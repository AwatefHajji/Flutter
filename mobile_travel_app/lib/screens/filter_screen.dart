import 'package:flutter/material.dart';
import 'package:mobile_travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filter-list';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  SwitchListTile buildSwitchListTile(String title, String subTitle,
      var currentValue, void Function(bool)? updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters"), actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ]),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    "Summer Trips", "showing only the summer trips", _summer,
                    (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Winter Trips", "showing only the winter trips", _winter,
                    (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    "Family Trips", "showing only the family trips", _family,
                    (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
