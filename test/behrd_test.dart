import 'package:flutter_test/flutter_test.dart';

import 'package:behrd/behrd.dart';

void main() {
  test('Correct device type used: Android', () {
    final BehrdSettings settings = BehrdSettings(groups: [], targetPlatform: DeviceType.android);
    expect(settings.targetPlatform, DeviceType.android);
  });

  test('Correct device type used: iOS', () {
    final BehrdSettings settings = BehrdSettings(groups: [], targetPlatform: DeviceType.iOS);
    expect(settings.targetPlatform, DeviceType.iOS);
  });

}
