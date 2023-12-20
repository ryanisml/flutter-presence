import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_presence/app/controllers/page_custom_controller.dart';
import 'package:flutter_presence/app/routes/app_pages.dart';
import 'package:flutter_presence/app/styles/app_color.dart';
import 'package:flutter_presence/app/widgets/custom_bottom_nav.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final pageIndexController = Get.find<PageCustomController>();

  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              Map<String, dynamic> userData = snapshot.data!.data()!;
              return ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 36),
                children: [
                  const SizedBox(height: 16),
                  // section 1 - profile
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 124,
                          height: 124,
                          color: Colors.blue,
                          child: Image.network(
                            (userData["avatar"] == null ||
                                    userData['avatar'] == "")
                                ? "https://ui-avatars.com/api/?name=${userData['name']}/"
                                : userData['avatar'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 4),
                        child: Text(
                          userData["name"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        userData["job"],
                        style: const TextStyle(color: AppColor.secondarySoft),
                      ),
                    ],
                  ),
                  // section 2 - menu
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 42),
                    child: Column(
                      children: [
                        MenuTile(
                          title: 'Update Profile',
                          icon: SvgPicture.asset(
                            'assets/icons/profile-1.svg',
                          ),
                          onTap: () => Get.toNamed(Routes.updateProfile,
                              arguments: userData),
                        ),
                        (userData["role"] == "admin")
                            ? MenuTile(
                                title: 'Add Employee',
                                icon: SvgPicture.asset(
                                  'assets/icons/people.svg',
                                ),
                                onTap: () => Get.toNamed(Routes.addEmployee),
                              )
                            : const SizedBox(),
                        MenuTile(
                          title: 'Change Password',
                          icon: SvgPicture.asset(
                            'assets/icons/password.svg',
                          ),
                          onTap: () => Get.toNamed(Routes.changePassword),
                        ),
                        MenuTile(
                          isDanger: true,
                          title: 'Sign Out',
                          icon: SvgPicture.asset(
                            'assets/icons/logout.svg',
                          ),
                          onTap: controller.logout,
                        ),
                        Container(
                          height: 1,
                          color: AppColor.primaryExtraSoft,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function() onTap;
  final bool isDanger;
  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.secondaryExtraSoft,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.primaryExtraSoft,
                borderRadius: BorderRadius.circular(100),
              ),
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color:
                      (isDanger == false) ? AppColor.secondary : AppColor.error,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: SvgPicture.asset('assets/icons/arrow-right.svg',
                  colorFilter: ColorFilter.mode(
                    (isDanger == false) ? AppColor.secondary : AppColor.error,
                    BlendMode.srcATop,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
