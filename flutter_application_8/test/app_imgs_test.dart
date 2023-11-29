import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_8/resources/resources.dart';

void main() {
  test('app_imgs assets test', () {
    expect(File(AppImgs.circle1).existsSync(), isTrue);
    expect(File(AppImgs.circle2).existsSync(), isTrue);
  });
}
