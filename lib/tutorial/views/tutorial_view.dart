import 'dart:developer' as dev;
import 'dart:ui' as ui;

import 'package:feature_discovery_bloc/tutorial/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialView extends StatefulWidget {
  const TutorialView({super.key});

  @override
  State<TutorialView> createState() => _TutorialViewState();
}

class _TutorialViewState extends State<TutorialView> {
  late TutorialCoachMark tutorialCoachMark;

  @override
  void initState() {
    final canShowTutorial = context.read<TutorialCubit>().state.showTutorial;
    if (canShowTutorial) {
      createTutorial();
      Future.delayed(Duration.zero, showTutorial);
    }
    super.initState();
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.black,
      textSkip: 'SKIP',
      paddingFocus: 5,
      opacityShadow: 0.5,
      imageFilter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        dev.log('finish');
      },
      onClickTarget: (target) {
        dev.log('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        dev.log('target: $target');
        dev.log(
            'clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}');
      },
      onClickOverlay: (target) {
        dev.log('onClickOverlay: $target');
      },
      onSkip: () {
        dev.log('skip');
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    final tutorials = context.read<TutorialCubit>().state.tutorials;
    for (final tutorial in tutorials) {
      switch (tutorial.step) {
        case TutorialStep.create:
          targets.add(
            TargetFocus(
              identify: '_tutorial_create_',
              keyTarget: tutorial.key,
              alignSkip: Alignment.topRight,
              enableOverlayTab: true,
              contents: [
                TargetContent(
                  align: ContentAlign.top,
                  builder: (context, controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'This is a simple tutorial for Create.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'You can tap the overlay to dismiss. ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
          break;
        case TutorialStep.download:
          targets.add(
            TargetFocus(
              identify: '_tutorial_',
              keyTarget: tutorial.key,
              contents: [
                TargetContent(
                  align: ContentAlign.bottom,
                  builder: (context, controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'This is a tutorial for Download.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
          break;
        case TutorialStep.submit:
          targets.add(
            TargetFocus(
              identify: '_tutorial_submit_',
              keyTarget: tutorial.key,
              enableOverlayTab: true,
              contents: [
                TargetContent(
                  align: ContentAlign.bottom,
                  builder: (context, controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'This is a tutorial for Submit.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'You can tap the overlay. '
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Proin pulvinar tortor eget maximus iaculis.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
          break;
        case TutorialStep.text:
          targets.add(
            TargetFocus(
              identify: '_tutorial_center_text_',
              keyTarget: tutorial.key,
              contents: [
                TargetContent(
                  align: ContentAlign.bottom,
                  builder: (context, controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Titulo lorem ipsum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.previous();
                          },
                          child: const Icon(Icons.chevron_left),
                        ),
                      ],
                    );
                  },
                )
              ],
              shape: ShapeLightFocus.RRect,
              radius: 5,
            ),
          );
          break;
      }
    }

    return targets;
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Wonderful App'),
        actions: const [
          DownloadButton(),
          SubmitButton(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CenterText(),
          ],
        ),
      ),
      floatingActionButton: const CreateButton(),
    );
  }
}
