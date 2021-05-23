import 'package:covid_19_tracker/provider/countries.dart';
import 'package:covid_19_tracker/widgets/table_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatTable extends StatefulWidget {
  @override
  _StatTableState createState() => _StatTableState();
}

class _StatTableState extends State<StatTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
          child: Consumer<Countries>(builder: (c, countryData, _) {
            var countries = countryData.countries;
            countries.sort((a, b) => b.cases.compareTo(a.cases));
            return ListView.builder(
              itemBuilder: (ctx, i) => i < countries.length - 1
                  ? TableEntry(
                      key: ValueKey(i),
                      isGrey: i % 2 == 0,
                      countryName: countries[i].countryName,
                      cases: NumberFormat.compactCurrency(
                        decimalDigits: 2,
                        symbol: '',
                      ).format(countries[i].cases),
                    )
                  : Container(
                      height: 0,
                    ),
              itemCount: countries.length,
            );
          }),
        ),
        width: double.infinity,
      ),
    );
  }
}
