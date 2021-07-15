import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pegotech/constants/constants.dart';
import 'package:pegotech/models/country.dart';

class CountriesApi {
  static fetchCountriesData() async {
    List<Country> countryList = [];
    try {
      var url = Uri.parse(COUNTRIES_API__URL);
      var response = await http.get(url);
      var result = jsonDecode(response.body);
      result.forEach((data) {
        var country = Country.fromJson(data);
        countryList.add(country);
      });
    } catch (e) {
      print(e);
    }
    return countryList;
  }
}
