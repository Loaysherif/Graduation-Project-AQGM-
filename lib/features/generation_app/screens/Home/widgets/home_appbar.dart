import 'package:flutter/material.dart';
import 'package:AQGM/common/widgets/Images/circular_image.dart';
import 'package:AQGM/utils/constants/image_strings.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
class AQGMHomeAppBar extends StatelessWidget {
  const AQGMHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AQGMAppBar(
      title:

          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            AQGMCircularImage(image: AQGMImages.lightAppLogo),
           ],),
    );

  }
}
