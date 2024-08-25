import 'package:financial_app/common/constants/constans_values.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final IconData icon;
  final String? path;

  ProfileMenuItem({
    required this.title,
    required this.icon,
    this.path,
  });
}

final List<ProfileMenuItem> profileMenus = [
  ProfileMenuItem(
    title: "Informasi Pribadi",
    icon: Icons.person_outline,
    path: ConstansValues.routeName.profileForm,
  ),
  ProfileMenuItem(
    title: "Ubah Password",
    icon: Icons.key,
  ),
  ProfileMenuItem(
    title: "Syarat & Ketentuan",
    icon: Icons.task,
  ),
  ProfileMenuItem(
    title: "Bantuan",
    icon: Icons.chat,
  ),
  ProfileMenuItem(
    title: "Kebijakan Privasi",
    icon: Icons.privacy_tip_outlined,
  ),
  ProfileMenuItem(
    title: "Log Out",
    icon: Icons.power_settings_new_sharp,
  ),
  ProfileMenuItem(
    title: "Hapus Akun",
    icon: Icons.restore_from_trash_rounded,
  ),
];
