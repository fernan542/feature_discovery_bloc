import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorialCubit, TutorialState>(
      builder: (context, state) {
        final tutorial = state.tutorials.firstWhere(
          (t) => t.step == TutorialStep.text,
        );

        return Text(
          'Feature Discovery with Bloc',
          key: tutorial.key,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        );
      },
    );
  }
}
