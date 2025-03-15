import '../models/user_model.dart';
import '../../core/network/api_client.dart';
import '../../core/network/endpoints.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  /// Fetch user profile
  Future<UserModel> getUserProfile() async {
    final response = await apiClient.get(Endpoints.getUserProfile);
    return UserModel.fromJson(response);
  }

  /// Update user profile
  Future<UserModel> updateUserProfile(UserModel user) async {
    final response = await apiClient.put(Endpoints.getUserProfile, body: user.toJson());
    return UserModel.fromJson(response);
  }
}
