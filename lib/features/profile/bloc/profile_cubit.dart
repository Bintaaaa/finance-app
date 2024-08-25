import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_app/common/extensions/comparated_value.dart';
import 'package:financial_app/common/states/state_action.dart';
import 'package:financial_app/data/profile/datasources/local/profile_repository.dart';
import 'package:financial_app/data/profile/entity/profile_entity.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({required this.profileRepository})
      : super(
          ProfileState(
            getProfileState: StateAction.initial(),
            updateProfileState: StateAction.initial(),
            pageIndex: 0,
            imagePath: "",
          ),
        );

  Future<void> getProfile() async {
    emit(
      state.copyWith(
        getProfileState: StateAction.loading(),
      ),
    );
    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await profileRepository.getProfile(1);
      emit(
        state.copyWith(
          getProfileState: StateAction.hasData(data: result),
        ),
      );
    } catch (e) {
      log("Error getProfile", zone: Zone.current, error: e);
      emit(
        state.copyWith(
          getProfileState: StateAction.error(message: "Terjadi Kesalahan Pada Sistem"),
        ),
      );
    }
  }

  Future<void> insertProfile(ProfileEntity profile) async {
    emit(
      state.copyWith(
        updateProfileState: StateAction.loading(),
      ),
    );
    try {
      await profileRepository.insertProfile(profile);
      pageIndex(state.pageIndex + 1);
      getProfile();
      await Future.delayed(const Duration(seconds: 1));
      emit(
        state.copyWith(
          updateProfileState: StateAction.hasData(data: true),
        ),
      );
    } catch (e) {
      log("Error insertProfile", zone: Zone.current, error: e);
      emit(
        state.copyWith(
          updateProfileState: StateAction.error(message: "Terjadi Kesalahan Pada Sistem"),
        ),
      );
    }
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    emit(
      state.copyWith(
        updateProfileState: StateAction.loading(),
      ),
    );
    try {
      await profileRepository.getProfile(profile.id);
      await profileRepository.updateProfile(profile);
      pageIndex(state.pageIndex + 1);
      getProfile();
      await Future.delayed(const Duration(seconds: 1));
      emit(
        state.copyWith(
          updateProfileState: StateAction.hasData(data: true),
        ),
      );
    } catch (e) {
      log("Error updateProfile", zone: Zone.current, error: e);
      insertProfile(profile);
      emit(state.copyWith(
        updateProfileState: StateAction.error(message: "Terjadi Kesalahan Pada Sistem"),
      ),);
    }}
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    log("the image is ${image?.path}");
    if (image.isNotNull()) {
      emit(
        state.copyWith(
          imagePath: image?.path,
        ),
      );
    }
  }

  void pageIndex(int index) {
    final int max = index > 2 ? 2 : index;
    emit(
      state.copyWith(pageIndex: max),
    );
  }
}
