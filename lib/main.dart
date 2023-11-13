import 'dart:developer' as dev;

import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feature Discovery with Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TutorialPage(),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    dev.log(
      'onChange: Previous => ${change.currentState} New => ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    dev.log('onClose: ${bloc.state}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    dev.log('onCreate: ${bloc.state}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    dev.log('Error: $bloc, error: $error, st: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
