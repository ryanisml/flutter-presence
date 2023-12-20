import 'package:get/get.dart';
import 'package:flutter_presence/app/modules/add_employee/bindings/add_employee_binding.dart';
import 'package:flutter_presence/app/modules/add_employee/views/add_employee_view.dart';
import 'package:flutter_presence/app/modules/all_presence/bindings/all_presence_binding.dart';
import 'package:flutter_presence/app/modules/all_presence/views/all_presence_view.dart';
import 'package:flutter_presence/app/modules/authentication/bindings/login_binding.dart';
import 'package:flutter_presence/app/modules/authentication/views/login_view.dart';
import 'package:flutter_presence/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:flutter_presence/app/modules/change_password/views/change_password_view.dart';
import 'package:flutter_presence/app/modules/detail_presence/bindings/detail_presence_binding.dart';
import 'package:flutter_presence/app/modules/detail_presence/views/detail_presence_view.dart';
import 'package:flutter_presence/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:flutter_presence/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:flutter_presence/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_presence/app/modules/home/views/home_view.dart';
import 'package:flutter_presence/app/modules/new_password/bindings/new_password_binding.dart';
import 'package:flutter_presence/app/modules/new_password/views/new_password_view.dart';
import 'package:flutter_presence/app/modules/profile/bindings/profile_binding.dart';
import 'package:flutter_presence/app/modules/profile/views/profile_view.dart';
import 'package:flutter_presence/app/modules/update_profile/bindings/update_pofile_binding.dart';
import 'package:flutter_presence/app/modules/update_profile/views/update_pofile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.newPassword,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.updateProfile,
      page: () => UpdatePofileView(),
      binding: UpdatePofileBinding(),
    ),
    GetPage(
      name: _Paths.detailPresence,
      page: () => DetailPresenceView(),
      binding: DetailPresenceBinding(),
    ),
    GetPage(
      name: _Paths.addEmployee,
      page: () => const AddEmployeeView(),
      binding: AddEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.changePassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.allPresence,
      page: () => const AllPresenceView(),
      binding: AllPresenceBinding(),
    ),
  ];
}
