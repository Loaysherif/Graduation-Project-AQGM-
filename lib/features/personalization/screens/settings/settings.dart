import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/common/widgets/Texts/section_heading.dart';
import 'package:AQGM/common/widgets/appbar/appbar.dart';
import 'package:AQGM/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:AQGM/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:AQGM/features/authentication/controllers/logout/logout_controller.dart';
import 'package:AQGM/features/personalization/screens/profile/profile.dart';
import 'package:AQGM/utils/constants/colors.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogoutController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AQGMPrimaryHeaderContainer(
                child: Column(
              children: [
                AQGMAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: AQGMColors.white))),
                 AQGMProfileTile(onPressed: ()=> Get.to(()=> const ProfileScreen()),),
                const SizedBox(height: AQGMSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
              child: Column(
                children: [
                  const AQGMSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AQGMSizes.spaceBtwItems),
                  AQGMSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage & connected accounts',
                      onTap: () {}),
                  AQGMSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subTitle: 'Set any kind of notification messages',
                      onTap: () {}),
                  AQGMSettingsMenuTile(
                      icon: Iconsax.more,
                      title: "More",
                      subTitle: "Discover more about us",
                      onTap: () {}),
                  AQGMSettingsMenuTile(
                      icon: Iconsax.message_question,
                      title: "FAQ",
                      subTitle: "Need Help?",
                      onTap: () {}),
                  const SizedBox(height: AQGMSizes.spaceBtwSections),
                  const AQGMSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AQGMSizes.spaceBtwItems),
                  AQGMSettingsMenuTile(
                      icon: Icons.cloud_upload_outlined,
                      title: "Load Data",
                      subTitle: "Upload data to your cloud",
                      onTap: () {}),
                  AQGMSettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD image quality",
                      subTitle: "Set image quality to be seen",
                      trailing: Switch(value: false, onChanged: (value) {})),

                  const SizedBox(height: AQGMSizes.spaceBtwSections),

                  SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () => controller.logout() ,child: const Text('LogOut'))
                  ),
                  const SizedBox(height: AQGMSizes.spaceBtwSections*2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
