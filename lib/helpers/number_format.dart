String convertToVND(int price) {
  String numberString = price.toString();
  String formatString = '';
  int cnt = 0;
  for(int i = numberString.length - 1; i >= 0; i--) {
    formatString = numberString[i] + formatString;
    cnt++;
    if(cnt == 3) {
      cnt = 0;
      if(i > 0) {
        formatString = '.' + formatString;
      }
    }
  }
  return formatString;
}