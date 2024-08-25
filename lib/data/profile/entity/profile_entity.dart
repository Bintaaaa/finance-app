import 'package:floor/floor.dart';

@entity
class ProfileEntity {
  @primaryKey
  final int id;
  final String? fullname;
  final String? bornDate;
  final String? sex;
  final String? nik;
  final String? imagePath;
  final String? address;
  final String? bankAccountNumber;
  final String? backBranchAccount;

  ProfileEntity({
    required this.id,
    this.fullname,
    this.bornDate,
    this.sex,
    this.nik,
    this.imagePath,
    this.address,
    this.bankAccountNumber,
    this.backBranchAccount,
  });
}
