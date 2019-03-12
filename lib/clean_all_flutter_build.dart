import 'dart:io';
import 'package:shell/shell.dart';

Future cleanFlutter(String path) async {
  var file = File(path);
  if (file.statSync().type == FileSystemEntityType.directory) {
    var dir = Directory(path);

    var list = dir.listSync(recursive: true);
    for (var child in list) {
      var names = child.absolute.path.split("/");
      if (names.last == "pubspec.yaml") {
        try {
          await _runCleanCommand(child.parent.absolute.path);
        } catch (e) {}
      }
    }
  }
}

Future _runCleanCommand(String path) async {
  var shell = new Shell();
  shell.workingDirectory = path;
  var ls = await shell.startAndReadAsString("flutter", ["clean"]);
  removeIosFramework(path);
  print(ls);
}

Future removeIosFramework(String path) async {
  var dir = Directory(path);

  clearIosFiles(path);

  var r = dir.listSync().any((test) {
    return test.absolute.path.split("/").last == "example";
  });

  if (r) {
    clearIosFiles(path + "/example");
  }
}

void clearIosFiles(String path) {
  var removeFiles = [
    "/ios/Flutter/App.framework",
    "/ios/Flutter/Flutter.framework",
    "/ios/Flutter/Generated.xcconfig",
    "/ios/Flutter/app.flx",
    "/ios/Flutter/app.zip",
    "/ios/Flutter/flutter_assets/",
  ];

  for (var f in removeFiles) {
    var p = path + f;
    print("will delete file $p");
    if (FileSystemEntity.isDirectorySync(p)) {
      Directory(p).deleteSync(recursive: true);
    } else if (FileSystemEntity.isFileSync(p)) {
      File(p).deleteSync();
    }
  }
}
