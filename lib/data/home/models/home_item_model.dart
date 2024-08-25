import 'package:flutter/material.dart';

class HomeItemModel {
  final String title;
  final String? imagePath;
  final int? price;
  final int? priceDiscount;
  final Icon? icon;

  HomeItemModel({
    required this.title,
    this.imagePath,
    this.price,
    this.priceDiscount,
    this.icon,
  });
}

final List<HomeItemModel> financeProducts = [
  HomeItemModel(title: "Urun", imagePath: "assets/finance/f1.png"),
  HomeItemModel(title: "Pembiayaan Porsi Haji", imagePath: "assets/finance/f2.png"),
  HomeItemModel(title: "Financial Check Up", imagePath: "assets/finance/f3.png"),
  HomeItemModel(title: "Asuransi Mobil", imagePath: "assets/finance/f4.png"),
  HomeItemModel(title: "Asuransi Properti", imagePath: "assets/finance/f5.png"),
];

final List<HomeItemModel> bottomNavItems = [
  HomeItemModel(
    title: "Beranda",
    icon: const Icon(
      Icons.home_outlined,
      color: Colors.amber,
    ),
  ),
  HomeItemModel(
    title: "Cari",
    icon: const Icon(
      Icons.search,
    ),
  ),
  HomeItemModel(
    title: "Keranjang",
    icon: const Icon(
      Icons.shopping_cart_outlined,
    ),
  ),
  HomeItemModel(
    title: "Daftar Transaksi",
    icon: const Icon(
      Icons.check_box,
    ),
  ),
  HomeItemModel(
    title: "Voucher",
    icon: const Icon(
      Icons.discount_rounded,
    ),
  ),
  HomeItemModel(
    title: "Alamat Pengiriman",
    icon: const Icon(
      Icons.pin_drop_outlined,
    ),
  ),
  HomeItemModel(
    title: "Daftar Teman",
    icon: const Icon(
      Icons.people_alt_outlined,
    ),
  ),
];
