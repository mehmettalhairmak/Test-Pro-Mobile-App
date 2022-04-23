class Errors {
  static String showError(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "This email address is already in use, please use a different email address";
      case 'user-not-found':
        return "There are no such users in the system.";
      case 'wrong-password':
        return "The password you entered is incorrect";
      default:
        return "Unknown Error";
    }
  }
}
