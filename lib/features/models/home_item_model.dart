class HomeItemModel {
  final String title;
  final String imagePath;
  final int? price;
  final int? priceDiscount;

  HomeItemModel({
    required this.title,
    required this.imagePath,
    this.price,
    this.priceDiscount,
  });
}

final List<HomeItemModel> financeProducts = [
  HomeItemModel(title: "Urun", imagePath: "assets/finance/f1.png"),
  HomeItemModel(title: "Pembiayaan Porsi Haji", imagePath: "assets/finance/f2.png"),
  HomeItemModel(title: "Financial Check Up", imagePath: "assets/finance/f3.png"),
  HomeItemModel(title: "Asuransi Mobil", imagePath: "assets/finance/f4.png"),
  HomeItemModel(title: "Asuransi Properti", imagePath: "assets/finance/f5.png"),
];
