import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_task/models/models.dart';
import 'package:test_task/repositories/repositories.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository _countryRepository;
  CountryBloc({@required CountryRepository countryRepository})
      : _countryRepository = countryRepository,
        super(CountryState.initial());

  @override
  Stream<CountryState> mapEventToState(
    CountryEvent event,
  ) async* {
    if (event is CountryMadeRequest) {
      yield* _mapCountryMadeRequestToState(event);
    } else if (event is CountrySearchedCountry) {
      yield* _mapCountrySearchedCountryToState(event);
    } else if (event is CountryDeletedItem) {
      yield* _mapCountryDeletedItemToState(event);
    }
  }

  Stream<CountryState> _mapCountryMadeRequestToState(
      CountryMadeRequest event) async* {
    try {
      yield (state.copyWith(status: CountryStatus.loading));
      final countries = await _countryRepository.getCountries();
      yield (state.copyWith(
          status: CountryStatus.loaded, countries: countries));
    } catch (e) {
      yield (state.copyWith(
          status: CountryStatus.error,
          failure: Failure(message: e.toString())));
    }
  }

  Stream<CountryState> _mapCountrySearchedCountryToState(
      CountrySearchedCountry event) async* {
    try {
      yield (state.copyWith(status: CountryStatus.loading));
      final country =
          await _countryRepository.searchByCountryName(name: event.countryName);
      yield (state.copyWith(status: CountryStatus.loaded, countries: country));
    } catch (e) {
      yield (state.copyWith(
          status: CountryStatus.error,
          failure: Failure(message: e.toString())));
    }
  }

  Stream<CountryState> _mapCountryDeletedItemToState(
      CountryDeletedItem event) async* {
    try {
      yield (state.copyWith(status: CountryStatus.loading));
      _countryRepository.deleteCountry(
          value: event.index, countries: event.countries);
      yield (state.copyWith(
          status: CountryStatus.loaded, countries: event.countries));
    } catch (e) {
      yield (state.copyWith(
          status: CountryStatus.error,
          failure: Failure(message: e.toString())));
    }
  }
}
