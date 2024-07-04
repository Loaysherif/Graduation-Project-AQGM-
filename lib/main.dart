
import 'package:AQGM/app.dart';
import 'package:AQGM/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

  /// -- Entry points of the flutter app
  Future<void> main() async {

    //to ensure optimum use of resources
  /// Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();


  // file-based storage system for more speed & efficiency
  /// GetX Local Storage
  await GetStorage.init();

  /// Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);



  /// Initialize Firebase & Authentication Repository
  await  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()),);


  /// Load all Material Design / Themes / Localization / Bindings
  runApp(const App());
}
