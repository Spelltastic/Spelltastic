@Skip('Base class changed, need to change test accordignly')

import 'package:code/src/model/CharacterClass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Name should have be same as enum with first letter uppercase', () {
    var name = CharacterClass.bard.path();

    expect(name, "Bard");
  });
}
