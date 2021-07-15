import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pegotech/api/countries_api.dart';
import 'package:pegotech/dao/country_dao.dart';
import 'package:pegotech/models/country.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countryData = [];

  get countryData => UnmodifiableListView(_countryData);

  void getLocalData() async {
    CountriesDao countriesDao = CountriesDao();
    _countryData = await countriesDao.getAllCountries();
    if (_countryData.isEmpty) {
      _countryData = await CountriesApi.fetchCountriesData();
    }
    notifyListeners();
  }
}
