import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Country {
  final String countryName;
  final String countryCode;
  int cases = 0;

  Country({
    required this.countryName,
    required this.countryCode,
    required this.cases,
  });
}

class CountryInfo with ChangeNotifier {
  int todayCases = 0;
  int totalCases = 0;
  int todayRecovered = 0;
  int totalRecovered = 0;
  int todayDeaths = 0;
  int totalDeaths = 0;

  CountryInfo() {
    fetchCurrentCountryData('worldwide');
    print('called');
  }

  Future<void> fetchCurrentCountryData(String? countryCode) async {
    var url = countryCode == "worldwide"
        ? Uri.parse('https://disease.sh/v3/covid-19/all')
        : Uri.parse('https://disease.sh/v3/covid-19/countries/$countryCode');
    try {
      var response = await http.get(url);
      var extractedData = json.decode(response.body);
      // if(countryCode == "worldwide"){
      //   print(extractedData);
      // }
      todayCases =
          extractedData['todayCases'] == null ? 0 : extractedData['todayCases'];
      totalCases = extractedData['cases'] == null ? 0 : extractedData['cases'];
      todayRecovered = extractedData['todayRecovered'] == null
          ? 0
          : extractedData['todayRecovered'];
      totalRecovered =
          extractedData['recovered'] == null ? 0 : extractedData['recovered'];
      todayDeaths = extractedData['todayDeaths'] == null
          ? 0
          : extractedData['todayDeaths'];
      totalDeaths =
          extractedData['deaths'] == null ? 0 : extractedData['deaths'];
      // print(extractedData);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

class Countries with ChangeNotifier {
  List<Country> _countryList = [];
  // Country List
  // https://disease.sh/v3/covid-19/countries
  // WorldWide Data
  // https://disease.sh/v3/covid-19/all
  // Country Data
  // https://disease.sh/v3/covid-19/countries/${countryCode}

  Countries() {
    fetchAndSetCountries();
  }

  List<Country> get countries {
    return [..._countryList];
  }

  Future<void> fetchAndSetCountries() async {
    var url = Uri.parse('https://disease.sh/v3/covid-19/countries');
    try {
      var response = await http.get(url);
      var extractedData = json.decode(response.body);
      _countryList.add(Country(
          countryCode: 'worldwide', countryName: 'WorldWide', cases: 0));
      //  print(extractedData);
      extractedData.forEach((data) => {
            _countryList.add(
              Country(
                countryName: data["country"],
                countryCode: data["countryInfo"]["iso2"].toString(),
                cases: data["cases"] == null ? 0 : data["cases"],
              ),
            )
          });
      notifyListeners();
      return;
    } catch (error) {
      print(error);
    }
  }
}
