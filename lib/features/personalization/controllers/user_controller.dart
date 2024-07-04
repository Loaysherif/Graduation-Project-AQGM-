
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:AQGM/data/repositories/repository_authentication/authentication_repository.dart';
import 'package:AQGM/data/user/user_repository.dart';
import 'package:AQGM/features/authentication/screens/login/login.dart';
import 'package:AQGM/features/personalization/models/user_model.dart';
import 'package:AQGM/features/personalization/screens/profile/widgets/Re_authentication.dart';
import 'package:AQGM/utils/constants/image_strings.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/utils/helpers/network_manager.dart';
import 'package:AQGM/utils/popups/full_screen_loader.dart';
import 'package:AQGM/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get isntance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // first update Rx user and then check if user data is already stored . if not store new data
      await fetchUserRecord();
      // if no record exists
      if(user.value.id.isEmpty){
        if (userCredential != null) {

          // Convert Name to First & Last Name
          final nameParts = UserModel.nomeParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user Data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      AQGMLoader.warningSnackBar(title: 'Data not saved',
          message: 'Something went wrong while saving your info. you can re-save your data in your profile');
    }
  }

  /// Delete account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(AQGMSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account? all data will be removed permanently',
        confirm: ElevatedButton(onPressed: ()async =>deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
         child: const Padding(padding: EdgeInsets.symmetric(horizontal: AQGMSizes.lg),child: Text('Delete'),
    )
    ),
      cancel: OutlinedButton(onPressed: ()=> Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel')),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try{
      AQGMFullscreenLoader.openLoadingDialog('Processing', AQGMImages.docerAnimation);

      // First re-Authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // Re verify Auth email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          AQGMFullscreenLoader.stopLoading();
          Get.offAll(() => const LogInScreen());
        } else if(provider == 'password'){
          AQGMFullscreenLoader.stopLoading();
          Get.to(()=> const ReAuthLoginForm());
        }
      }
    } catch(e) {
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.warningSnackBar(title: 'Oh Snap...!',message: e.toString());
    }
  }

  ///  Re-Authentication before deleting
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      AQGMFullscreenLoader.openLoadingDialog('Processing', AQGMImages.docerAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AQGMFullscreenLoader.stopLoading();
        return;
      }
      if(!reAuthFormKey.currentState!.validate()) {
        AQGMFullscreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticatewithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      AQGMFullscreenLoader.stopLoading();
      Get.offAll(()=> const LogInScreen());
    } catch(e){
      AQGMFullscreenLoader.stopLoading();
      AQGMLoader.warningSnackBar(title: 'Oh Snap...!',message: e.toString());
    }
  }

  /// Upload Profile pic
  uploadProfilePicture()async{
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
    if(image != null){
      imageUploading.value=true;
      //upload image
      final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

      // update image record
      Map<String,dynamic> json = {'ProfilePicture': imageUrl};
      await userRepository.updateSingleField(json);

      user.value.profilePicture = imageUrl;
      user.refresh();
      AQGMLoader.successSnackBar(title: 'Congratulations',message: 'Your profile picture has been updated!');
    }
  }
  catch(e){AQGMLoader.errorSnackBar(title: 'OhSnap',message: 'Something Went wrong :$e');}
    finally{
    imageUploading.value = false;
    }
   }
  }

