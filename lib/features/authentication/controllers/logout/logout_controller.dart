import 'package:get/get.dart';
import '../../../../data/repositories/repository_authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';


 class LogoutController extends GetxController
 {

   Future<void> logout ()async {
     try{

       // Start loader
       AQGMFullscreenLoader.openLoadingDialog(
           'Logging you out...', AQGMImages.docerAnimation);

       // Check internet connectivity
       final isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {
         // Remove loader
         AQGMFullscreenLoader.stopLoading();
         return;
       }
       // Logout
       final userCredentials = await AuthenticationRepository.instance.logout();

       // Remove Loader
       AQGMFullscreenLoader.stopLoading();

       // Redirect
       AuthenticationRepository.instance.screenRedirect();

     } catch (e){
       AQGMFullscreenLoader.stopLoading();
       AQGMLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
     }
   }

 }