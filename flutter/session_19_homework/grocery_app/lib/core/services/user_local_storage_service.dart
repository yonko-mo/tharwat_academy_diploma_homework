import 'dart:convert';

import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';

class UserLocalStorageService {
  void saveUser(UserModel user) {
    final jsonString = jsonEncode(user.toJson());
    SharedPreferencesSingleton.instance.setString(
      AppConstants.cachedUser,
      jsonString,
    );
  }

  UserModel? getUser() {
    final jsonString = SharedPreferencesSingleton.instance.getString(
      AppConstants.cachedUser,
    );
    if (jsonString == null) return null;
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }

  void clearUser() {
    SharedPreferencesSingleton.instance.remove(AppConstants.cachedUser);
  }
}
