import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityService {
  StreamController<InternetConnectionStatus> connectivityStreamController =
      StreamController<InternetConnectionStatus>();
  InternetConnectivityService() {
    InternetConnectionChecker()
        .onStatusChange
        .listen((internetConnectionStatus) {
      connectivityStreamController.add(internetConnectionStatus);
    });
  }
}
