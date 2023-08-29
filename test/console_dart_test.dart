import 'package:flutter_test/flutter_test.dart';
import 'package:console_dart/console_dart.dart';

void main() {
  test('adds one to input values', () {
    load([]);
    load(['--help']);
    load(['-c', 'test', '-s']);
  });
}

