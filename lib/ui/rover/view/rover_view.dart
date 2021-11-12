import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:parasut_rover_flutter/core/base/base_loader.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';
import 'package:parasut_rover_flutter/entities/model/rover.dart';
import 'package:parasut_rover_flutter/ui/rover/viewmodel/rover_viewmodel.dart';
import 'package:parasut_rover_flutter/ui/widgets/image_card.dart';

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
      builder: (context, model, _) => CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
            CupertinoSliverNavigationBar(
              largeTitle: Text(rover.name),
              trailing: CupertinoButton(
                child: Icon(Icons.filter_alt_rounded),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            )
          ],
          body: BaseLoader(
            state: model.state,
            child: Padding(
              padding: context.paddingNormal,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: model.photos.length,
                itemBuilder: (context, index) {
                  var photo = model.photos.elementAt(index);
                  return GestureDetector(
                    onTap: () => model.goToImageViewer(photo.imgSrc),
                    child: ImageCard(
                      source: photo.imgSrc!,
                      title: photo.camera?.fullName ?? "",
                      date: photo.earthDate,
                    ),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index.isEven ? 1.5 : 1.5);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
