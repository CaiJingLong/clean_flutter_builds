用于批量清理 flutter 下的所有构建文件

## 使用方法

在使用前你必须保证自己将 dart 和 pub 配置到了环境变量中，否则无法使用

1. `$ pub get`

2. `$ dart bin/clean_flutter_build_file.dart ~/code/flutter` //这里的第三个就是你要清理的 flutter 目录

### 使用 pub global

`$ pub global activate clean_flutter_build_file`

`$ clean_flutter_build_file ${flutter_project_path}`

## 说明

我这里随着进入 flutter 开发的领域越来越长，硬盘中积攒了大量的 demo，所以不可避免的占用了大量的磁盘空间（我这里清理前大概在 20G 左右）

所以简单写了一个 dart 脚本工具用于清理,清理后占用空间缩小到不到 1G，这还是有公司项目的大量资源文件的情况下，以前每个 demo 大概需要 100M 左右，主要来自于 iOS 的库文件

主要包含以下两个步骤

### 1. flutter clean

使用 flutter clean 删除 flutter 生成的构建文件，这部分包含 build 目录和 .dart_tool 目录

实际的开发项目中会包含很多自动生成的文件，这些文件只需要再次运行 flutter packages get 或 flutter run 就会自动生成，所以一般不会进入版本控制工具

### 2. iOS 的大文件

这里删除了 iOS 中一些较大的文件，主要包括

- /ios/Flutter/Flutter.framework
- /ios/Flutter/App.framework
- /ios/Flutter/flutter_assets

如果还需要删除其他的文件，可以考虑你项目生成时的 .gitignore 文件，其中包括了所有可以自动生成的文件，这里没有一一加入
