import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:parasut_rover_flutter/core/base/base_service.dart';
import 'package:parasut_rover_flutter/core/base/failure.dart';
import 'package:parasut_rover_flutter/core/constants/storage_constants.dart';
import 'package:parasut_rover_flutter/entities/dto/user_model.dart';

class LoginService extends BaseService {
  Future<Failure?> loginWithFacebook() async {
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      switch (facebookLoginResult.status) {
        case LoginStatus.success:
          final userData = await FacebookAuth.instance.getUserData();

          final credential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);

          await Firebase.initializeApp();
          await FirebaseAuth.instance.signInWithCredential(credential);
          //await _addUserToFirestore(userData);
          
          storage.setData(StorageConstants.AUTH_KEY, credential.accessToken);
          session.user = UserModel.fromJson(userData);

          return null;
        case LoginStatus.cancelled:
          return Failure(errorMessage: 'Login cancelled');
        case LoginStatus.failed:
          return Failure(errorMessage: 'An error occurred. Try again');
        default:
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          return Failure(errorMessage: 'This account exists with a different sign in provider');
        case 'invalid-credential':
          return Failure(errorMessage: 'Unknown error has occurred');
        case 'operation-not-allowed':
          return Failure(errorMessage: 'This operation is not allowed');
        case 'user-disabled':
          return Failure(errorMessage: 'The user you tried to log into is disabled');
        case 'user-not-found':
          return Failure(errorMessage: 'The user you tried to log into was not found');
        default:
          return Failure(errorMessage: 'Try again later');
      }
    }
  }

  // Future _addUserToFirestore(Map<String, dynamic> userData) async {
  //   await FirebaseFirestore.instance.collection("users").add({
  //     'email': userData["email"],
  //     'imageUrl': userData['picture']['data']['url'],
  //     'name': userData['name'],
  //   });
  // }
}
