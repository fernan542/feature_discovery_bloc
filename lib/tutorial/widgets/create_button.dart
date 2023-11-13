import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorialCubit, TutorialState>(
      builder: (context, state) {
        final tutorial = state.tutorials.firstWhere(
          (t) => t.step == TutorialStep.create,
        );

        return FloatingActionButton(
          key: tutorial.key,
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.create),
        );
      },
    );
  }
}
