part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}


class CountryMadeRequest extends CountryEvent {

}
class CountrySearchedCountry extends CountryEvent {
  final String countryName;

  CountrySearchedCountry({@required this.countryName});
}

class CountryDeletedItem extends CountryEvent {
  final int index;
  final List<Country> countries;

  CountryDeletedItem({@required this.index,@required this.countries});
}