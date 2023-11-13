import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Change the value to show / hide tutorial.
      // Hypothetically, the value should came from data source.
      create: (context) => TutorialCubit(showTutorial: true)..generateKeys(),
      child: const TutorialView(),
    );
  }
}
