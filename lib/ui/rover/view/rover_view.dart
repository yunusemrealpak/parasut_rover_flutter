
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:parasut_rover_flutter/core/enum/types.dart';
import 'package:parasut_rover_flutter/entities/dto/photo.dart';
import 'package:parasut_rover_flutter/ui/widgets/creation_aware_list_item.dart';

import '../../../core/base/base_loader.dart';
import '../../../core/base/base_view.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../entities/model/rover.dart';
import '../viewmodel/rover_viewmodel.dart';

class RoverView extends StatefulWidget {
  final Rover rover;
  const RoverView({Key? key, required this.rover}) : super(key: key);

  @override
  State<RoverView> createState() => _RoverViewState();
}

class _RoverViewState extends State<RoverView> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseView<RoverViewModel>(
      viewModel: RoverViewModel(),
      onModelReady: (model) {
        model.init(widget.rover);
      },
      builder: (context, model, _) => CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
            CupertinoSliverNavigationBar(
              largeTitle: FadeInDown(child: Text(widget.rover.name)),
              trailing: CupertinoButton(
                child: Icon(Icons.filter_alt_rounded, color: Colors.white),
                onPressed: model.goToFilter,
                padding: EdgeInsets.zero,
              ),
              automaticallyImplyLeading: false,
            )
          ],
          body: BaseLoader(
            state: model.state,
            child: Stack(
              children: [
                Padding(
                  padding: context.paddingNormal,
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 4,
                    controller: _scrollController,
                    itemCount: model.photos.length,
                    itemBuilder: (context, index) {
                      var photo = model.photos.elementAt(index);
                      return FadeInUp(
                        delay: Duration(milliseconds: 100),
                        duration: Duration(milliseconds: (index * 50) + 800),
                        child: GestureDetector(
                          onTap: () => model.goToImageViewer(photo),
                          child: CreationAwareListItem(
                            itemCreated: () {
                              SchedulerBinding.instance!.addPostFrameCallback((duration) => model.handleItemCreated(index));
                            },
                            child: buildImage(photo),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 4 : 2),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                ),
                Visibility(
                  visible: model.moreState == ViewState.Busy,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: context.customWidthValue(0.15),
                      color: Colors.black45,
                      child: Center(
                        child: Platform.isAndroid ? SpinKitCircle(color: context.cupertinoTheme.primaryColor) : CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildImage(Photo photo) {
    return Container(
      color: Colors.black,
      child: CachedNetworkImage(
        imageUrl: photo.imgSrc!,
        fit: BoxFit.cover,
      ),
    );
  }
}
