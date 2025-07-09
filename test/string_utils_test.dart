import 'package:behrd/src/utils/string_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:behrd/behrd.dart';

void main() {
  test('firstLetterUpper: Empty string', () {
    final String result = StringUtils.firstLetterUpper("");
    expect("", result);
  });

  test('firstLetterUpper: 1 character only', () {
    final String result = StringUtils.firstLetterUpper("a");
    expect("A", result);
  });

  test('firstLetterUpper: 2 characters', () {
    final String result = StringUtils.firstLetterUpper("aA");
    expect("Aa", result);
  });

  test('firstLetterUpper: 10 characters', () {
    final String result = StringUtils.firstLetterUpper("aAaBbbCccD");
    expect("Aaabbbcccd", result);
  });


}
