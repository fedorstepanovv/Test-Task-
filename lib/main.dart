import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/repositories/country/country_repository.dart';
import 'package:test_task/screens/countries/bloc/country_bloc.dart';
import 'package:test_task/screens/countries/countries_screen.dart';
import 'package:test_task/simple_bloc_observer.dart';


void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => CountryRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Countries test task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CountryBloc(
            countryRepository: context.read<CountryRepository>()
          )..add(CountryMadeRequest()),
          child: CountryScreen(),
        ),
      ),
    );
  }
}
