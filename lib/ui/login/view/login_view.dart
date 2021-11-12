import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parasut_rover_flutter/core/constants/lottie_constants.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            LottieConstants.ROVER_PATH,
            repeat: true,
          ),
          Container(
            width: context.customWidthValue(0.6),
            height: 50,
            decoration: BoxDecoration(color: Color(0xFF784319), borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook),
                SizedBox(width: context.mediumWidthValue),
                Text(
                  "Facebook ile Giriş",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
