part of 'tutorial_cubit.dart';

enum TutorialStep { download, create, text, submit }

class TutorialData extends Equatable {
  final GlobalKey key;
  final TutorialStep step;

  const TutorialData({
    required this.key,
    required this.step,
  });

  @override
  List<Object?> get props => [key, step];
}

class TutorialState extends Equatable {
  const TutorialState({
    this.tutorials = const [],
    this.showTutorial = false,
  });

  final List<TutorialData> tutorials;
  final bool showTutorial;

  @override
  List<Object> get props => [tutorials, showTutorial];

  TutorialState copyWith({
    List<TutorialData>? tutorials,
    bool? showTutorial,
  }) {
    return TutorialState(
      tutorials: tutorials ?? this.tutorials,
      showTutorial: showTutorial ?? this.showTutorial,
    );
  }
}
