import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/ui/app/viewmodel/app_viewmodel.dart';
import 'package:parasut_rover_flutter/ui/rover/view/rover_view.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, keepPage: false);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  _jumpToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      viewModel: AppViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          bottomNavigationBar: _bottomNavigationBar(model),
          body: PageView.builder(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var rover = model.rovers.elementAt(index);
              return RoverView(rover: rover);
            },
            itemCount: model.rovers.length,
          ),
        );
      },
    );
  }
  
  Widget _bottomNavigationBar(AppViewModel model) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
      onTap: _jumpToPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "",
        ),
      ],
    );
  }
}
