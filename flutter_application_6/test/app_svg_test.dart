import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_6/resources/resources.dart';

void main() {
  test('app_svg assets test', () {
    expect(File(AppSvg.ambulance).existsSync(), isTrue);
    expect(File(AppSvg.bookAdd).existsSync(), isTrue);
    expect(File(AppSvg.favorite).existsSync(), isTrue);
    expect(File(AppSvg.settings).existsSync(), isTrue);
    expect(File(AppSvg.spreadsheet).existsSync(), isTrue);
    expect(File(AppSvg.userPlus).existsSync(), isTrue);
    expect(File(AppSvg.user).existsSync(), isTrue);
  });
}
