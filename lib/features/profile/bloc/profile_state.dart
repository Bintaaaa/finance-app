part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final StateAction<ProfileEntity> getProfileState;
  final StateAction<bool> updateProfileState;
  final int pageIndex;
  final String imagePath;

  const ProfileState({
    required this.getProfileState,
    required this.updateProfileState,
    required this.pageIndex,
    required this.imagePath,
  });

  ProfileState copyWith({
    StateAction<ProfileEntity>? getProfileState,
    StateAction<bool>? updateProfileState,
    int? pageIndex,
    String? imagePath,
  }) =>
      ProfileState(
        getProfileState: getProfileState ?? this.getProfileState,
        updateProfileState: updateProfileState ?? this.updateProfileState,
        pageIndex: pageIndex ?? this.pageIndex,
        imagePath: imagePath ?? this.imagePath,
      );

  @override
  List<Object?> get props => [
        getProfileState,
        updateProfileState,
        pageIndex,
        imagePath,
      ];
}
