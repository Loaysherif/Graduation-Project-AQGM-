import 'package:AQGM/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:AQGM/data/user/user_repository.dart';
import 'package:AQGM/features/authentication/screens/login/login.dart';
import 'package:AQGM/features/authentication/screens/onboarding/onboarding.dart';
import 'package:AQGM/features/authentication/screens/signup/verify_email.dart';
import 'package:AQGM/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:AQGM/utils/exceptions/format_exceptions.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authentication user data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart app launch
  @override
  void onReady() {
    // Remove native splash screen
    FlutterNativeSplash.remove();
    // Redirect to proper screen
    screenRedirect();
  }

  /// Function to show relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // If user is logged in
      if (user.emailVerified) {
        // If the users email has been verified, navigate to the main navigation menu
        Get.offAll(() =>  NavigationMenu());
      } else {
        // if the users email has not been verified, navigate to the verify email screen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    else {
      // Local storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      // Check its the first time using the app
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LogInScreen())
          : Get.offAll(const OnboardingScreens());
    }
  }

  /* --------------------------------------- Email & Password Sign-in ---------------------------------------*/

  /// [Email Authentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///  [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///  [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///  [Re-Authentication] - ReAuthentication User
  Future<void> reAuthenticatewithEmailAndPassword(
      String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///  [Email Authentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

/* ----------------------------------- Federated identity @ Social Sign-in -----------------------------------*/

  /// [Google Authentication] - Valid for any authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain the authentication details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //Once signed In return UserCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong $e');
      return null;
    }
  }

  /// [X Authentication] - Valid for any authentication

/* ----------------------------------end Federated identity @ Social Sign-in ---------------------------------*/

  /// [Logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut(); //GoogleSignIn.disconnect()
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LogInScreen());
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Delete User] - Remove user authentication & Firestore account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AQGMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AQGMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AQGMFormatException();
    } on PlatformException catch (e) {
      throw AQGMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
