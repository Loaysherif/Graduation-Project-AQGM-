import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../Images/circular_image.dart';

class AQGMProfileTile extends StatelessWidget {
  const AQGMProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : AQGMImages.user;
        return  AQGMCircularImage(
          image: image,
          width: 56,
          height: 56,
          padding: 0,
          isNetworkImage: networkImage.isNotEmpty,
        );

      }),
      title: Obx(()=> Text(controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AQGMColors.white))),
      subtitle: Obx(()=> Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .apply(color: AQGMColors.white))),
      trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color: AQGMColors.white,),),
    );
  }
}