
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa25/bloc/currency_bloc.dart';
import 'package:vazifa25/logic/repostories/currency_repostory.dart';
import 'package:vazifa25/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CurrencyRepository currencyRepository = CurrencyRepository();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CurrencyBloc(currencyRepository),
        child: HomeScreen(),
      ),
    );
  }
}