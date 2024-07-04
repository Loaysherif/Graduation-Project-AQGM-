import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:AQGM/bindings/general_bindings.dart';
import 'package:AQGM/utils/constants/colors.dart';
import 'package:AQGM/utils/constants/text_strings.dart';
import 'package:AQGM/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AQGMTexts.appName,
      themeMode: ThemeMode.system,
      theme:  AQGMAppTheme.lightTheme,
      darkTheme:  AQGMAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      /// Show Loader or Circular progress indicator meanwhile Authentication Repository is deciding to show  relevant screen
      home: const Scaffold(backgroundColor: AQGMColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
