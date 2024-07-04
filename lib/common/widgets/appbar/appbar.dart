import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/device/device_utility.dart';
import 'package:get/get.dart';

class AQGMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AQGMAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AQGMSizes.md),
      child: AppBar(
        automaticallyImplyLeading: true,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AQGMDeviceUtils.getAppBarHeight());
}
