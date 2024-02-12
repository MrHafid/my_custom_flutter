enum VALIDATION_TYPE { TEXT, EMAIL, PASSWORD }
enum LANG_TYPE { ID, ENG }
RegExp EMAIL_REGEX = new RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

String? isRequired(String? val, String? fieldName, LANG_TYPE langType) {
  if (val == null || val == '') {
    return langType == LANG_TYPE.ENG
        ? "$fieldName is required"
        : "$fieldName tidak boleh kosong!";
    // return '';
  }
  return null;
}

String? checkPasswordLength(String val, LANG_TYPE langType) {
  if (val.length < 6) {
    return langType == LANG_TYPE.ENG
        ? 'Password must be 6 digit'
        : 'Password harus 6 digit atau lebih';
  }
  return null;
}

String? checkFieldValidation(
    {String? val,
    String? fieldName,
    VALIDATION_TYPE? fieldType,
    LANG_TYPE langType = LANG_TYPE.ID}) {
  String? errorMsg;

  if (fieldType == VALIDATION_TYPE.TEXT) {
    errorMsg = isRequired(val, fieldName, langType);
  }

  if (fieldType == VALIDATION_TYPE.EMAIL) {
    if (isRequired(val, fieldName, langType) != null) {
      errorMsg = isRequired(val, fieldName, langType);
    } else if (!EMAIL_REGEX.hasMatch(val!)) {
      errorMsg = langType == LANG_TYPE.ENG
          ? "Please enter valid email"
          : "Tolong masukan email yang benar";
    }
  }

  if (fieldType == VALIDATION_TYPE.PASSWORD) {
    if (isRequired(val, fieldName, langType) != null) {
      errorMsg = isRequired(val, fieldName, langType);
    } else if (checkPasswordLength(val!, langType) != null) {
      errorMsg = checkPasswordLength(val, langType);
    }
  }
  return (errorMsg != null) ? errorMsg : null;
}
