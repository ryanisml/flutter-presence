part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const login = _Paths.login;
  static const newPassword = _Paths.newPassword;
  static const forgotPassword = _Paths.forgotPassword;
  static const profile = _Paths.profile;
  static const updateProfile = _Paths.updateProfile;
  static const detailPresence = _Paths.detailPresence;
  static const addEmployee = _Paths.addEmployee;
  static const changePassword = _Paths.changePassword;
  static const allPresence = _Paths.allPresence;
}

abstract class _Paths {
  static const home = '/home';
  static const login = '/login';
  static const newPassword = '/new-password';
  static const forgotPassword = '/forgot-password';
  static const profile = '/profile';
  static const updateProfile = '/update-pofile';
  static const detailPresence = '/detail-presence';
  static const addEmployee = '/add-employee';
  static const changePassword = '/change-password';
  static const allPresence = '/all-presence';
}
