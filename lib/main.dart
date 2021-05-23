import 'dart:io';

import 'package:covid_19_tracker/provider/countries.dart';
import 'package:covid_19_tracker/widgets/stat_row.dart';
import 'package:covid_19_tracker/widgets/stat_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Countries(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CountryInfo(),
        ),
      ],
      child: MaterialApp(
        title: 'COVID-19 TRACKER',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.white,
        ),
        home: MyHomePage(title: 'COVID-19 TRACKER'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ?_chosenValue = 'worldwide';

  Future<void> futureBuilder() async {
    sleep(
      Duration(seconds: 1),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Consumer<Countries>(
            builder: (ctx, countryData, _) => DropdownButton<String>(
              value: _chosenValue,
              hint: Text(
                "WorldWide",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              items:
                  countryData.countries.map<DropdownMenuItem<String>>((data) {
                return DropdownMenuItem<String>(
                  value: data.countryCode,
                  child: Text(data.countryName),
                );
              }).toList(),
              onChanged: (item) => {
                setState(() {
                  _chosenValue = item;
                })
              },
            ),
          ),
          StatRow(_chosenValue),
          Container(
            width: double.infinity,
            child: Text(
              'WorldWide Live Cases',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(8),
          ),
          StatTable(),
        ],
      )),
    );
  }
}
