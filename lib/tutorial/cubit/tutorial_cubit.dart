import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tutorial_state.dart';

class TutorialCubit extends Cubit<TutorialState> {
  TutorialCubit({
    required bool showTutorial,
  }) : super(
          TutorialState(showTutorial: showTutorial),
        );

  void generateKeys() {
    final tutorials = TutorialStep.values
        .map((step) => TutorialData(key: GlobalKey(), step: step))
        .toList();

    emit(state.copyWith(tutorials: tutorials));
  }
}
