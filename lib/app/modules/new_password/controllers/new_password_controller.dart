import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_presence/app/controllers/page_custom_controller.dart';
import 'package:flutter_presence/app/routes/app_pages.dart';
import 'package:flutter_presence/app/widgets/custom_toast.dart';
import 'package:flutter_presence/default_data.dart';

class NewPasswordController extends GetxController {
  final pageIndexController = Get.find<PageCustomController>();
  RxBool isLoading = false.obs;
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  RxBool newPassObs = true.obs;
  RxBool newPassCObs = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  void newPassword() async {
    if (passC.text.isNotEmpty && confirmPassC.text.isNotEmpty) {
      if (passC.text == confirmPassC.text) {
        isLoading.value = true;
        if (passC.text != DefaultData.defaultPassword) {
          _updatePassword();
          isLoading.value = false;
        } else {
          CustomToast.errorToast('Error', 'you must change your password');
          isLoading.value = false;
        }
      } else {
        CustomToast.errorToast('Error', 'password doesnt match');
      }
    } else {
      CustomToast.errorToast('Error', 'you must fill all form');
    }
  }

  void _updatePassword() async {
    try {
      String email = auth.currentUser!.email!;
      await auth.currentUser!.updatePassword(passC.text);
      // relogin
      await auth.signOut();
      await auth.signInWithEmailAndPassword(email: email, password: passC.text);
      Get.offAllNamed(Routes.home);

      pageIndexController.changePage(0);
      CustomToast.successToast('success', 'success update password');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomToast.errorToast(
            'Error', 'password too weak, you need at least six charachter');
      }
    } catch (e) {
      CustomToast.errorToast('Error', 'error : ${e.toString()}');
    }
  }
}
