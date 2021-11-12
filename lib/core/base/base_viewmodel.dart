
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parasut_rover_flutter/core/navigation/navigation_service.dart';

import '../enum/types.dart';
import '../storage/storage_service.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext? context;

  NavigationService? nvgSrv = NavigationService.instance;
  StorageService storage = StorageService();

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  bool disposed = false;

  setContext(BuildContext context) => this.context = context;

  setState(ViewState state) {
    _state = state;
    if (!disposed) notifyListeners();
  }
  
  saveChanges(){
    if (!disposed) notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
