import 'package:test_task/models/models.dart';

abstract class BaseCountryRepository {
  Future<List<Country>> getCountries();
  Future<List<Country>> searchByCountryName({String name});
  void deleteCountry({int value,List<Country> countries});

}