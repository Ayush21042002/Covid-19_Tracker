import 'package:flutter/material.dart';

class TableEntry extends StatelessWidget {
  final bool isGrey;
  final String countryName;
  final String cases;

  const TableEntry({
    Key? key,
    required this.isGrey,
    required this.countryName,
    required this.cases,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          boxShadow: [
            BoxShadow(
              color: isGrey ? Colors.grey : Colors.white10,
            )
          ]),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(countryName),
          Text('$cases'),
        ],
      ),
    );
  }
}
