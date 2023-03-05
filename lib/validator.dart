class Validator {
  static String? validateName({required String? name}) {
    if (name!.isEmpty) {
      return "Name can't be empty";
    } else if (!RegExp(r"^[A-Za-z][A-Za-z0-9 ]{5,29}$").hasMatch(name)) {
      return "Enter Correct Name";
    }
    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email!.isEmpty) {
      return "Email Address can't be empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(email)) {
      return "Enter Correct Email Address";
    }
    return null;
  }

  // static String? validatephone({required String? phone}) {
  //   if (phone!.isEmpty) {
  //     return "Phone Number can't be empty";
  //   } else if (!RegExp(r"^[7-9]{1}[0-9]{9}").hasMatch(phone)) {
  //     return "Enter Correct Phone Number";
  //   }
  //   return null;
  // }

  static String? validatepassword({required String? password}) {
    if (password!.isEmpty) {
      return "Password can't be empty";
    } else if (!RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,32}$")
        .hasMatch(password)) {
      return "Enter Correct Password";
    }
    return null;
  }
}
