import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';
import 'package:parasut_rover_flutter/ui/rover/viewmodel/rover_viewmodel.dart';

class RoverView extends StatelessWidget {
  final Rover rover;
  const RoverView({Key? key, required this.rover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RoverViewModel>(
      viewModel: RoverViewModel(),
      onModelReady: (model) {
        model.init(rover);
      },
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Text(rover.name),
        ),
      ),
    );
  }
}
