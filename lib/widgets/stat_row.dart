import 'package:intl/intl.dart';
import 'package:covid_19_tracker/provider/countries.dart';
import 'package:covid_19_tracker/widgets/row_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatRow extends StatefulWidget {
  final String? countryCode;

  StatRow(this.countryCode);

  @override
  _StatRowState createState() => _StatRowState();
}

class _StatRowState extends State<StatRow> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CountryInfo>(context, listen: false)
        .fetchCurrentCountryData(widget.countryCode);
    return Container(
      padding: EdgeInsets.all(10),
      child: Consumer<CountryInfo>(
        builder: (ctx, countryInfoData, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowCard(
              key: ValueKey('Cases'),
              title: 'Cases',
              cases: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.todayCases),
              total: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.totalCases),
              backgroundColor: Colors.red,
            ),
            RowCard(
              key: ValueKey('Recovered'),
              title: 'Recovered',
              cases: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.todayRecovered),
              total: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.totalRecovered),
              backgroundColor: Colors.green,
            ),
            RowCard(
              key: ValueKey('Deaths'),
              title: 'Deaths',
              cases: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.todayDeaths),
              total: NumberFormat.compactCurrency(
                decimalDigits: 2,
                symbol: '',
              ).format(countryInfoData.totalDeaths),
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
      width: double.infinity,
    );
  }
}
