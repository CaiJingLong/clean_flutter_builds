用于批量清理 flutter 下的所有构建文件

## 使用方法

1. `$ pub get`

2. `$ dart bin/clean_flutter.dart ~/code/flutter`

## 说明

使用 flutter clean 删除 flutter 生成的构建文件，这部分包含 build 目录和 .dart_tool 目录

实际的开发项目中会包含很多自动生成的文件，这些文件只需要再次运行 flutter packages get 或 flutter run 就会自动生成，所以一般不会进入版本控制工具

这里删除了 iOS 中一些较大的文件，主要包括

- /ios/Flutter/Flutter.framework
- /ios/Flutter/App.framework
- /ios/Flutter/flutter_assets

如果还需要删除其他的文件，可以考虑你项目生成时的 .gitignore 文件，其中包括了所有可以自动生成的文件，这里没有一一加入
