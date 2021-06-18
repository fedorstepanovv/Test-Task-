import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:test_task/configs/urls.dart';
import 'package:test_task/models/country.dart';
import 'package:test_task/repositories/country/base_country_repository.dart';
import 'package:http/http.dart' as http;

class CountryRepository implements BaseCountryRepository {
  @override
  Future<List<Country>> getCountries() async {
    List<Country> countriesList;
    Uri uri = Uri.parse(ApiUrls.countriesUrl);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var countries = countryFromJson(response.body);
      countriesList = countries;
    }
    return countriesList;
  }
  @override
  Future<List<Country>> searchByCountryName({@required String name}) async {
    List<Country> countriesList;

    final String url =
        "https://restcountries.eu/rest/v2/name/$name?fullText=true";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var countries = countryFromJson(response.body);
      countriesList = countries;
    }
    return countriesList;
  }

  @override
  void deleteCountry({int value, List<Country> countries}) {
          countries.removeAt(value);

  }
  

}
