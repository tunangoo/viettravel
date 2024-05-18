import 'package:viettravel/models/place_summary_model.dart';

int levenshteinDistance(String s1, String s2) {
  int m = s1.length;
  int n = s2.length;

  List<List<int>> dp = List.generate(m + 1, (i) => List.filled(n + 1, 0));

  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++) {
      if (i == 0) {
        dp[i][j] = j; // s1 is empty, insert all characters of s2
      } else if (j == 0) {
        dp[i][j] = i; // s2 is empty, remove all characters of s1
      } else if (s1[i - 1] == s2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1]; // characters match, no change
      } else {
        dp[i][j] = 1 + [
          dp[i - 1][j], // remove
          dp[i][j - 1], // insert
          dp[i - 1][j - 1] // replace
        ].reduce((a, b) => a < b ? a : b);
      }
    }
  }

  return dp[m][n];
}

double similarityScore(String s1, String s2) {
  int distance = levenshteinDistance(s1, s2);
  int maxLength = s1.length > s2.length ? s1.length : s2.length;
  return 1.0 - (distance / maxLength); // Return a score between 0 and 1
}


String removeDiacritics(String str) {
  final withDiacritics = 'aàáảãạăằắẳẵặâầấẩẫậđeèéẻẽẹêềếểễệiìíỉĩịoòóỏõọôồốổỗộơờớởỡợuùúủũụưừứửữựyỳýỷỹỵ';
  final withoutDiacritics = 'aaaaaaaaaaaaaaaaaadeeeeeeeeeeeeiiiiiioooooooooooooooooouuuuuuuuuuuuyyyyyy';
  final diacriticsMap = Map.fromIterables(withDiacritics.split(''), withoutDiacritics.split(''));

  return str.split('').map((char) => diacriticsMap[char] ?? char).join('');
}

List<String> searchSuggestion(List<String> allPlaceNames, String keyword) {
  String normalizedKeyword = removeDiacritics(keyword.toLowerCase());

  // Chuyển đổi danh sách địa điểm thành dạng chuẩn hóa và tính độ gần giống
  List<Map<String, dynamic>> normalizedPlaces = allPlaceNames.map((placeName) {
    String normalizedPlaceName = removeDiacritics(placeName.toLowerCase());
    double score = similarityScore(normalizedPlaceName, normalizedKeyword);
    return {'placeName': placeName, 'score': score};
  }).toList();

  // Sắp xếp danh sách theo độ gần giống
  normalizedPlaces.sort((a, b) => b['score'].compareTo(a['score']));
  // Trả về danh sách đã sắp xếp
  return normalizedPlaces.map((e) => e['placeName'] as String).toList();
}
List<PlaceSummaryModel> searchResult(List<PlaceSummaryModel> places, String keyword) {
  String normalizedKeyword = removeDiacritics(keyword.toLowerCase());

  // Chuyển đổi danh sách địa điểm thành dạng chuẩn hóa và tính độ gần giống
  List<Map<String, dynamic>> normalizedPlaces = places.map((place) {
    String normalizedPlaceName = removeDiacritics(place.name.toLowerCase());
    double score = similarityScore(normalizedPlaceName, normalizedKeyword);
    return {'place': place, 'score': score};
  }).toList();

  // Sắp xếp danh sách theo độ gần giống
  normalizedPlaces.sort((a, b) => b['score'].compareTo(a['score']));
  // Trả về danh sách đã sắp xếp
  return normalizedPlaces.map((e) => e['place'] as PlaceSummaryModel).toList();
}