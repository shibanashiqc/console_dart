// ignore_for_file: avoid_print

library console_dart;

import 'dart:io';
import 'package:args/args.dart';

void load(List<String> arguments) {
  try {
    
  if (arguments.contains('--help')) {
    print('''
    Usage: create_file [options] <name> stl|stf
    Options:
      -c, --create-file    Create a file
      -s, --stl            Create a stateless widget
      -f, --stf            Create a statefull widget
    ''');
    return;
  }
    
  final results = ArgParser()
    ..addOption('create-file', abbr: 'c')
    ..addFlag('stl', abbr: 's')
    ..addFlag('stf', abbr: 'f');
    
  final argResults = results.parse(arguments);
  
  final name = argResults['create-file'];
  final stl = argResults['stl'];
  final stf = argResults['stf'];
  
 
  if (name != null) {
    
  print('Creating file $name');
    
  if (stl) {
    final stubs = File('lib/stub/stateless.stub').readAsStringSync();
    CreateFile.createFile(name, stubs);
    print('Stateless widget created successfully PATH: $name');
  }else if (stf) {
    final stubs = File('lib/stub/statefull.stub').readAsStringSync();
    CreateFile.createFile(name, stubs);
    print('Statefull widget created successfully PATH: $name');
  }else{
    print('Please provide a type of widget'); 
  }
  
  }else{
    print('Please provide a name for the file');
  }
  
  }
  catch (e) {
    print(e);
  }
  
}

class CreateFile {
  static void createFile(String name, stubs) {
    try {
    final path = '${Directory.current.path}/lib/';
    final file = File('$path$name.dart'); 
    final className = name.split('/').last;
    final classNameUpper = className[0].toUpperCase() + className.substring(1);
    final stub = stubs.replaceAll('WIDGET', classNameUpper);
    file.createSync(recursive: true);
    file.writeAsStringSync(stub);
    } catch (e) {
      print(e);
    }
  }
}

