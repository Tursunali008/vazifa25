import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa25/bloc/bloc_obthorver.dart';
import 'package:vazifa25/bloc/currency_bloc.dart';
import 'package:vazifa25/bloc/currency_event.dart';
import 'package:vazifa25/logic/repostories/currency_repostory.dart';
import 'package:vazifa25/ui/screens/home_screen.dart';

void main() {
  Bloc.observer = CurrencyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currencyRepository = CurrencyRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: BlocProvider(
        create: (context) =>
            CurrencyBloc(currencyRepository)..add(FetchCurrencies()),
        child: HomeScreen(),
      ),
    );
  }
}
