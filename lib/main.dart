import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile_assessment/root_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MobileAssessmentApp(isDebug: false,));
  }, (exception, stackTrace) async {
  });
}
