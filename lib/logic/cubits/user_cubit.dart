import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit({required this.userRepository}) : super(UserInitial());

  /// Fetch User Profile
  Future<void> fetchUserProfile() async {
    try {
      emit(UserLoading());
      final user = await userRepository.getUserProfile();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  /// Update User Profile
  Future<void> updateUserProfile(UserModel user) async {
    try {
      emit(UserUpdating());
      final updatedUser = await userRepository.updateUserProfile(user);
      emit(UserUpdated(updatedUser));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
