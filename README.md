<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Console Dart: A package to help you create files and folders in your project with a single command.

## Features

Console Dart: Create stateless and stateful widgets with a single command.


## Getting started

Console Dart: List prerequisites and provide or point to information on how to
start using the package.

## Usage

Console Dart:  List the steps needed to use the package.

Step 1: Add this to your package's pubspec.yaml file:

Step 2: Create a file in in root not in lib folder and name it console or any name you want. i suggest you to use console. don't need add .dart extension.

Step 3: Replace the content of the file with the following code:


```dart
import 'package:console_dart/console_dart.dart';

void main(List<String> arguments){
  load(arguments);
}

```

Step 4: How to run on terminal:

 Usage: create_file [options] <name> stl|stf
    Options:
      -c, --create-file    Create a file
      -s, --stl            Create a stateless widget
      -f, --stf            Create a statefull widget
      
 Example: dart console -c my_widget -s, dart console -c my_widget -f
 console file iam using the name of the folder that i created in the root of my project. you can use any name you want.
 
 
```dart
dart console -c my_widget -s
dart console -c my_widget -f
```
 

## Additional information

Console Dart: If you want to contribute to this project, please contact me at: [email](mailto:shibanashiq697@gmail.com)
