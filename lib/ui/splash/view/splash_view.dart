import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/base_view.dart';
import '../../../core/base/blur_loading.dart';
import '../../../core/constants/lottie_constants.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, _) {
        return CupertinoPageScaffold(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Expanded(
                flex: 2,
                child: Lottie.asset(
                  LottieConstants.MINI_ROVER_PATH,
                  repeat: true,
                ),
              ),
              Expanded(child: BlurLoading(color: Color(0xFF784319))),
            ],
          ),
        );
      },
    );
  }
}
