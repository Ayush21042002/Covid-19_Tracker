import 'package:flutter/material.dart';

class RowCard extends StatelessWidget {
  final String title;
  final String ?cases;
  final String ?total;
  final Color ?backgroundColor;

  RowCard({
    Key? key,
    required this.title,
    required this.cases,
    required this.total,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      margin: EdgeInsets.all(6),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "+$cases",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total: +$total',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
    );
  }
}
