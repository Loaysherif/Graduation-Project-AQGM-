import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:AQGM/utils/constants/colors.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/helpers/helper_functions.dart';

import '../../../features/personalization/screens/profile/widgets/shimmer.dart';

class AQGMCircularImage extends StatelessWidget {
  const AQGMCircularImage(
      {super.key,
        this.fit = BoxFit.cover,
        required this.image,
        this.isNetworkImage = false,
        this.overLayColor,
        this.backgroundColor,
        this.width = 56,
        this.height = 56,
        this.padding = AQGMSizes.sm
      });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(width:width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor??(AQGMHelperFunctions.isDarkMode(context)?AQGMColors.black:AQGMColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Center(
          child: isNetworkImage?CachedNetworkImage(imageUrl: image,fit: fit,color: overLayColor,
            progressIndicatorBuilder: (context, url, downloadProgress) => const AQGMShimmerEffect(width: 55, height: 55,radius: 55),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
          :Image(fit: fit, image: isNetworkImage?NetworkImage(image): AssetImage(image) as ImageProvider, color: overLayColor,
          ),
        ),
      )
    );
  }
}
