//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:battery_plus_web/battery_plus_web.dart';
import 'package:connectivity_plus_web/connectivity_plus_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  BatteryPlusPlugin.registerWith(registrar);
  ConnectivityPlusPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
