String validatePassword(String value) {
  if (value.length < 8) {
    return 'Mật khẩu phải chứa ít nhất 8 ký tự';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Mật khẩu phải chứa ít nhất một chữ hoa';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Mật khẩu phải chứa ít nhất một chữ thường';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Mật khẩu phải chứa ít nhất một số';
  }
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt';
  }
  return '';
}

String validateUsername(String value) {
  if (value.isEmpty == true || value == '') {
    return 'Tên đăng nhập không được để trống';
  }
  if (value.contains(' ')) {
    return 'Tên đăng nhập không được chứa khoảng trắng';
  }
  return '';
}

bool validateTextField(String value) {
  if (value.isEmpty == true || value == '') {
    return false;
  }
  return true;
}