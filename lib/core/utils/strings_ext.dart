extension EmailValidator on String? {
  bool isValidEmail() {
    return isNullOrEmpty()
        ? false
        : RegExp(
                r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(this!);
  }
}

extension StringValidator on String? {
  bool isNotNullOrEmpty() =>
      (this == null || this?.isEmpty == true) ? false : true;
  bool isNullOrEmpty() =>
      (this == null || this?.isEmpty == true) ? true : false;
}
