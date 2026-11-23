
class Validation {
  static String? emailValidation(String? userInput) {
    final value = userInput?.trim() ?? '';
    if (value.isEmpty) {
      return 'You must input your email';
    }

    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$",
    ).hasMatch(value);

    if (!emailValid) {
      return 'You must enter a valid email';
    }

    return null;
  }

  static String? phoneValidation(String? userInput) {
    final raw = userInput?.trim() ?? '';
    if (raw.isEmpty) {
      return 'You must input your phone number';
    }

    // Normalize common spacing/dashes before checking the pattern
    final normalized = raw.replaceAll(RegExp(r'[\s\-]'), '');

    final bool phoneValid = RegExp(
      r'^(?:\+20|0020|0)?1[0125][0-9]{8}$',
    ).hasMatch(normalized);

    if (!phoneValid) {
      return 'You must enter a valid phone number';
    }

    return null;
  }
}