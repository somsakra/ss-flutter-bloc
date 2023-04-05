
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ss_flutter_state/src/app_route.dart';
import 'package:ss_flutter_state/src/bloc/counter_a_bloc/app_bloc_observer.dart';
import 'package:ss_flutter_state/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:ss_flutter_state/src/bloc/counter_b_bloc/counter_b_bloc.dart';
import 'package:ss_flutter_state/src/pages/home_page.dart';

void main() {
  // runApp(const MyApp());

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterABloc = BlocProvider<CounterABloc>(create: (context)=> CounterABloc());
    final counterBBloc = BlocProvider<CounterBBloc>(create: (context)=> CounterBBloc());

    return MultiBlocProvider(
      providers: [counterABloc,counterBBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Home Page'),
      ),
    );
  }
}
