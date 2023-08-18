import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
void listenForBluetoothConnection() {
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    log(result.toString());
   if (result == ConnectivityResult.bluetooth) {
  log('connected to bluetooth');
} else if(result == ConnectivityResult.bluetooth){}
  });
}
}