import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_6/resources/resources.dart';

void main() {
  test('app_img assets test', () {
    expect(File(AppImg.group).existsSync(), isTrue);
    expect(File(AppImg.maskGroup).existsSync(), isTrue);
    expect(File(AppImg.maskGroup4).existsSync(), isTrue);
    expect(File(AppImg.maskGroup1).existsSync(), isTrue);
    expect(File(AppImg.maskGroup).existsSync(), isTrue);
    expect(File(AppImg.maskGroup3).existsSync(), isTrue);
    expect(File(AppImg.ambulance).existsSync(), isTrue);
    expect(File(AppImg.bell).existsSync(), isTrue);
    expect(File(AppImg.bookAdd).existsSync(), isTrue);
    expect(File(AppImg.collection).existsSync(), isTrue);
    expect(File(AppImg.details).existsSync(), isTrue);
    expect(File(AppImg.doc1).existsSync(), isTrue);
    expect(File(AppImg.doc2).existsSync(), isTrue);
    expect(File(AppImg.doc3).existsSync(), isTrue);
    expect(File(AppImg.eyedropper).existsSync(), isTrue);
    expect(File(AppImg.favorite).existsSync(), isTrue);
    expect(File(AppImg.settings).existsSync(), isTrue);
    expect(File(AppImg.spreadsheet).existsSync(), isTrue);
    expect(File(AppImg.userPlus).existsSync(), isTrue);
    expect(File(AppImg.user).existsSync(), isTrue);
    expect(File(AppImg.welcomeIcon1).existsSync(), isTrue);
    expect(File(AppImg.welcomeIcon2).existsSync(), isTrue);
    expect(File(AppImg.welcomeIcon3).existsSync(), isTrue);
    expect(File(AppImg.welcomeIcon4).existsSync(), isTrue);
  });
}
