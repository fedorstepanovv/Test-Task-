part of 'country_bloc.dart';

enum CountryStatus { initial, loading, loaded, error }

class CountryState extends Equatable {
  final CountryStatus status;
  final List<Country> countries;

  final Failure failure;
  const CountryState(
      {@required this.status,
      @required this.countries,
      @required this.failure,
      });

  @override
  List<Object> get props => [status, countries, failure,];
  factory CountryState.initial() {
    return CountryState(
        countries: [], status: CountryStatus.initial, failure: Failure(),);
  }

  CountryState copyWith({
    CountryStatus status,
    List<Country> countries,
    Failure failure,
  }) {
    return CountryState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      failure: failure ?? this.failure,
    );
  }
}
