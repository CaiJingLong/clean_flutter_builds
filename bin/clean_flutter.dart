import 'package:clean_all_flutter_build/clean_all_flutter_build.dart';

main(List<String> arguments) {
  print(arguments);

  for (var path in arguments) {
    cleanFlutter(path);
  }
}
