import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_11/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.heart).existsSync(), isTrue);
    expect(File(Images.home2).existsSync(), isTrue);
    expect(File(Images.location).existsSync(), isTrue);
    expect(File(Images.shoppingcart).existsSync(), isTrue);
    expect(File(Images.tenisEpicReact).existsSync(), isTrue);
    expect(File(Images.user).existsSync(), isTrue);
  });
}
