import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_10/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.spidey).existsSync(), isTrue);
  });
}
