import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parasut_rover_flutter/core/base/base_loader.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/ui/login/viewmodel/login_viewmodel.dart';

import '../../../core/constants/lottie_constants.dart';
import '../../../core/extensions/context_extensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      builder: (context, model, _) => BaseLoader(
        state: model.state,
        child: CupertinoPageScaffold(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FadeIn(
                delay: Duration(milliseconds: 350),
                duration: Duration(milliseconds: 1200),
                child: Lottie.asset(
                  LottieConstants.ROVER_PATH,
                  repeat: true,
                ),
              ),
              FadeInUp(
                delay: Duration(milliseconds: 850),
                duration: Duration(milliseconds: 800),
                from: 20,
                child: GestureDetector(
                  onTap: () => model.loginWithFacebook(),
                  child: Container(
                    width: context.customWidthValue(0.6),
                    height: 50,
                    decoration: BoxDecoration(color: Color(0xFF784319), borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(width: context.mediumWidthValue),
                        Text(
                          "Continue with Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              FadeInDown(
                delay: Duration(milliseconds: 850),
                duration: Duration(milliseconds: 800),
                from: 20,
                child: TextButton(
                  onPressed: model.loginWithGuest,
                  child: Text(
                    "Continue as Guest",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
