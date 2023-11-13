import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorialCubit, TutorialState>(
      builder: (context, state) {
        final tutorial = state.tutorials.firstWhere(
          (t) => t.step == TutorialStep.download,
        );

        return IconButton(
          key: tutorial.key,
          onPressed: () {},
          icon: const Icon(Icons.download),
        );
      },
    );
  }
}
