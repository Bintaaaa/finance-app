import 'dart:developer';
import 'dart:io';

import 'package:financial_app/common/extensions/return_old_value.dart';
import 'package:financial_app/common/states/state_action.dart';
import 'package:financial_app/common/widgets/text_field_widget.dart';
import 'package:financial_app/data/profile/entity/profile_entity.dart';
import 'package:financial_app/features/profile/bloc/profile_cubit.dart';
import 'package:financial_app/features/profile/section/profile_from_stepper_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({super.key});

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final TextEditingController _fullNameController = TextEditingController(text: "");
  final TextEditingController _dateController = TextEditingController(text: "");
  final TextEditingController _sexController = TextEditingController(text: "LAKI-LAKI");
  final TextEditingController _identityNumberController = TextEditingController(text: "");
  final TextEditingController _addressController = TextEditingController(text: "");
  final TextEditingController _bankAccountNumber = TextEditingController(text: "");
  final TextEditingController _bankBranchController = TextEditingController(text: "");

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _dateController.dispose();
    _sexController.dispose();
    _identityNumberController.dispose();
    _addressController.dispose();
    _bankAccountNumber.dispose();
    _bankBranchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Pribadi"),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (prev, curr) => prev.updateProfileState != curr.updateProfileState,
        listener: (context, state) {
          final status = state.updateProfileState.status;
          final currentIndex = state.pageIndex;
          log("listen changes status $status");
          if (status.isHasData) {
            const snackBar = SnackBar(
              content: Text('Yay! A Berhasil Menyimpan Data!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            if (currentIndex == 2) {
              context.pop();
            }
          }
        },
        builder: (context, state) {
          final currentIndex = state.pageIndex;
          String imagePath = state.imagePath;
          final status = state.getProfileState.status;
          if (status.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (status.isHasData) {
            final data = state.getProfileState.data;
            _fullNameController.text = data!.fullname.returnEmptyString();
            _dateController.text = data.bornDate.returnEmptyString();
            _sexController.text = data.sex.returnEmptyString(value: "LAKI-LAKI");
            _identityNumberController.text = data.nik.returnEmptyString();
            _addressController.text = data.address.returnEmptyString();
            _bankAccountNumber.text = data.bankAccountNumber.returnEmptyString();
            _bankBranchController.text = data.backBranchAccount.returnEmptyString();
            imagePath = data.imagePath.returnEmptyString();
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const StepperSection(),
                if (currentIndex == 0)
                  ProfileFirstFormSection(
                    fullNameController: _fullNameController,
                    dateController: _dateController,
                    latestEducationController: _sexController,
                  ),
                if (currentIndex == 1)
                  ProfileSeconFormSection(
                    imagePath: imagePath,
                    identityNumberController: _identityNumberController,
                  ),
                if (currentIndex == 2)
                  ProfileThirdFormSection(
                    addressController: _addressController,
                    bankAccountNumber: _bankAccountNumber,
                    bankBranchController: _bankBranchController,
                  ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProfileCubit>().updateProfile(
                            ProfileEntity(
                              id: 1,
                              fullname: _fullNameController.text.returnOldValue(),
                              bornDate: _dateController.text.returnOldValue(),
                              sex: _sexController.text.returnOldValue(),
                              imagePath: imagePath,
                              nik: _identityNumberController.text.returnOldValue(),
                              address: _addressController.text.returnOldValue(),
                              backBranchAccount: _bankBranchController.text.returnOldValue(),
                              bankAccountNumber: _bankAccountNumber.text.returnOldValue(),
                            ),
                          );
                    },
                    child: const Text("Selanjutnya"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileThirdFormSection extends StatelessWidget {
  const ProfileThirdFormSection({
    super.key,
    required TextEditingController addressController,
    required TextEditingController bankAccountNumber,
    required TextEditingController bankBranchController,
  })  : _addressController = addressController,
        _bankAccountNumber = bankAccountNumber,
        _bankBranchController = bankBranchController;

  final TextEditingController _addressController;
  final TextEditingController _bankAccountNumber;
  final TextEditingController _bankBranchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldWidget.text(
          title: "ALAMAT LENGKAP",
          controller: _addressController,
        ),
        FieldWidget.text(
          title: "NOMOR REKENING",
          controller: _bankAccountNumber,
        ),
        FieldWidget.text(
          title: "CABANG PEMBUKAAN REKENING",
          controller: _bankBranchController,
        ),
      ],
    );
  }
}

class ProfileSeconFormSection extends StatelessWidget {
  final TextEditingController identityNumberController;
  const ProfileSeconFormSection({
    super.key,
    required this.imagePath,
    required this.identityNumberController,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          imagePath.isEmpty
              ? InkWell(
                  onTap: () async {
                    context.read<ProfileCubit>().pickImage();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: const Icon(
                          Icons.credit_card_sharp,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      const Text("Upload KTP")
                    ],
                  ),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            imagePath,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(18.0)),
                ),
          FieldWidget.text(controller: identityNumberController, title: "NIK"),
        ],
      ),
    );
  }
}

class ProfileFirstFormSection extends StatelessWidget {
  const ProfileFirstFormSection({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController dateController,
    required TextEditingController latestEducationController,
  })  : _fullNameController = fullNameController,
        _dateController = dateController,
        _latestEducationController = latestEducationController;

  final TextEditingController _fullNameController;
  final TextEditingController _dateController;
  final TextEditingController _latestEducationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldWidget.text(
          title: "NAMA LENGKAP",
          controller: _fullNameController,
        ),
        FieldWidget.calendar(
          title: "TANGGAL LAHIR",
          controller: _dateController,
        ),
        FieldWidget.dropdown(
          value: _latestEducationController.text,
          title: "JENIS KELAMIN",
          controller: _dateController,
          items: const [
            DropdownMenuItem(
              value: "LAKI-LAKI",
              child: Text("LAKI-LAKI"),
            ),
            DropdownMenuItem(
              value: "PEREMPUAN",
              child: Text("PEREMPUAN"),
            ),
          ],
          onChange: (value) {
            _latestEducationController.text = value;
          },
        ),
      ],
    );
  }
}
