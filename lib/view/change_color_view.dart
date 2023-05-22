import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:test_application/base.dart';
import 'package:test_application/navigators/change_screen_navigator.dart';
import 'package:test_application/viewmodel/change_color_viewmodel.dart';

class ChangeColorView extends StatefulWidget {
  static const String routeName = 'change-color-screen';

  const ChangeColorView({super.key});

  @override
  State<ChangeColorView> createState() => _ChangeColorViewState();
}

class _ChangeColorViewState
    extends BaseView<ChangeColorView, ChangeColorViewModel>
    implements ChangeColorNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  ChangeColorViewModel initViewModel() {
    return ChangeColorViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeColorViewModel>(
      builder: (context, viewModel, _) {
        return GestureDetector(
          onTap: viewModel.changeBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: viewModel.backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: LottieBuilder.network(
                      "https://assets5.lottiefiles.com/packages/lf20_puciaact.json",
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: viewModel.textColor,
                    ),
                    textAlign: TextAlign.center,
                    child: Center(
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        repeatForever: true,
                        pause: const Duration(milliseconds: 1200),
                        animatedTexts: [
                          TyperAnimatedText(
                            'Hello there',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
