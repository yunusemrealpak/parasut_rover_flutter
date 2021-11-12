import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/base/base_loader.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/ui/app/viewmodel/app_viewmodel.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      viewModel: AppViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: BaseLoader(child: Container(), state: model.state),
        );
      },
    );
  }
}
