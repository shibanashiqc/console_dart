// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

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
      -d, --delete         Delete a file
    ''');
      return;
    }
    
   
    if (arguments.contains('-d') || arguments.contains('--delete')) {
      final path = '${Directory.current.path}/lib/';
      final file = File('$path${arguments[arguments.length - 1]}.dart');
      if(file.existsSync()){
      file.deleteSync(recursive: true);
      print('File deleted successfully PATH: $path');
      }else{
        print('File does not exist');
      }
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

      //publish stub file

      if (stl) {
        const statelessStub = '''import 'package:flutter/material.dart';

  class WIDGET extends StatelessWidget {
    const WIDGET ({super.key});

    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }''';

        CreateFile.createFile(name, statelessStub);
        print('Stateless widget created successfully PATH: $name');
      } else if (stf) {
        const statefullStub = '''import 'package:flutter/material.dart';

class WIDGET extends StatefulWidget {
  const WIDGET({super.key});

  @override
  State<WIDGET> createState() => _WIDGETState();
}

class _WIDGETState extends State<WIDGET> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}''';
        CreateFile.createFile(name, statefullStub);
        print('Statefull widget created successfully PATH: $name');
      } else {
        print('Please provide a type of widget');
      }
    } else {
      print('Please provide a name for the file');
    }
  } catch (e) {
    print(e);
  }
}

class CreateFile {
  static void createFile(String name, stubs) {
    try {
      final path = '${Directory.current.path}/lib/';
      final file = File('$path$name.dart');
      final className = name.split('/').last;
      final classNameUpper =
          className[0].toUpperCase() + className.substring(1);
      final stub = stubs.replaceAll('WIDGET', classNameUpper);
      file.createSync(recursive: true);
      file.writeAsStringSync(stub);
    } catch (e) {
      print(e);
    }
  }
}
