
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/enum/notification_type.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';
import 'package:parasut_rover_flutter/core/session/session.dart';

import '../enum/types.dart';
import '../navigation/navigation_service.dart';
import '../storage/storage_service.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext? context;

  NavigationService? nvgSrv = NavigationService.instance;
  Session session = Session.instance!;
  StorageService storage = StorageService();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  
  ViewState _moreState = ViewState.Idle;
  ViewState get moreState => _moreState;

  bool disposed = false;

  setContext(BuildContext context) => this.context = context;

  setState(ViewState state) {
    _state = state;
    if (!disposed) notifyListeners();
  }
  
  setMoreState(ViewState state) {
    _moreState = state;
    if (!disposed) notifyListeners();
  }
  
  saveChanges(){
    if (!disposed) notifyListeners();
  }
  
  showNotification(NotificationType type, String message,
      {Color? customColor}) {
    var color = type == NotificationType.ERROR ? Colors.red : Colors.green;
    BotToast.showAttachedWidget(
      attachedBuilder: (_) => Container(
        width: context!.width,
        padding: EdgeInsets.only(top: context!.customWidthValue(0.15)),
        child: Container(
          color: customColor ?? color,
          width: context!.customWidthValue(1),
          height: context!.customHeightValue(0.07),
          child: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      target: const Offset(0, 0),
    );
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
