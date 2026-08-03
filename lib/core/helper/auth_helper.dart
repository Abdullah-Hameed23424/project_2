/// [AuthHelper]
/// A helper class for authentication-related operations, such as clearing authentication data and logging out the user
/// The name of this class is connect with the name of the feature that is responsible for authentication, and it is used in the error handling process to log out the user when an unauthorized error occurs.

// class AuthHelper {
//   static Future<void> clearAuthData() async {
//     await AppStorage.removeToken();
//     AppStorage.removeActualRole();
//     AppStorage.removeRole();
//     AppStorage.removeMyId();
//     await AppSharedPreferences.removeUserState();
//     await NetworkClient.init();
//   }

//   static Future<void> logout() async {
//     await clearAuthData();
//     AppRoutes.toSplashScreen();
//   }
// }
// TODO just uncomment the code above when the authentication feature is implemented, and remove this comment.
