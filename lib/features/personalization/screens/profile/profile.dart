import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:AQGM/common/widgets/Images/circular_image.dart';
import 'package:AQGM/common/widgets/Texts/section_heading.dart';
import 'package:AQGM/common/widgets/appbar/appbar.dart';
import 'package:AQGM/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:AQGM/features/personalization/screens/profile/widgets/shimmer.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AQGMAppBar(
        showBackArrow: true ,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AQGMSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AQGMImages.user;
                      return controller.imageUploading.value
                          ? const AQGMShimmerEffect(
                        width: 80, height: 80, radius: 80,)
                          : AQGMCircularImage(image: image,
                          width: 150,
                          height: 150,
                          isNetworkImage: networkImage.isNotEmpty);
                    }

                    ),
                    TextButton(
                        onPressed: () => controller.uploadProfilePicture(),
                        child: const Text("Change Profile Picture")),
                  ],
                ),
              ),
              const SizedBox(height: AQGMSizes.spaceBtwItems/2),
              const Divider(),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              const AQGMSectionHeading(title: 'Profile Information',showActionButton: false),
              const SizedBox(height: AQGMSizes.spaceBtwItems),

               Obx(()=> ProfileMenu(onPressed: (){},title:'Name' ,value: controller.user.value.fullName)),
               Obx(()=>  ProfileMenu(onPressed: (){},title:'Username' ,value: controller.user.value.username)),

               const SizedBox(height: AQGMSizes.spaceBtwItems),
               const Divider(),
               const SizedBox(height: AQGMSizes.spaceBtwItems),

              const AQGMSectionHeading(title: 'Personal Information',showActionButton: false),
              const SizedBox(height: AQGMSizes.spaceBtwItems),

          Obx(()=> ProfileMenu(onPressed: (){},title:'User ID' ,value: controller.user.value.id,icon: Iconsax.copy )),
          Obx(()=>     ProfileMenu(onPressed: (){},title:'E-mail' ,value: controller.user.value.email)),
          Obx(()=>     ProfileMenu(onPressed: (){},title:'Phone Num' ,value: controller.user.value.phoneNumber)),

              const Divider(),
              const SizedBox(height: AQGMSizes.spaceBtwItems),
              
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Delete Account',style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


