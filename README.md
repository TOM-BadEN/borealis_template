# Borealis Switch 应用模板

基于 [xfangfang-borealis 模板](https://github.com/xfangfang/borealis_template) 精简的 Nintendo Switch 专用模板。

主要改动：
- 删除了非 Switch 平台的代码和配置
- 使用 Makefile 包装编译指令

## 项目结构

```
borealis_template/
├── CMakeLists.txt      # CMake 构建配置
├── Makefile            # 编译脚本
├── demo/               # 模板源代码
│   ├── include/        # 头文件
│   │   ├── activity/   # Activity 定义
│   │   ├── tab/        # Tab 页面定义
│   │   └── view/       # 自定义视图定义
│   └── src/            # 源文件
│       ├── activity/   # Activity 实现
│       ├── tab/        # Tab 页面实现
│       ├── view/       # 自定义视图实现
│       └── main.cpp    # 程序入口
├── resources/          # 资源文件
│   ├── i18n/           # 国际化文本
│   ├── img/            # 图片资源
│   ├── xml/            # UI 布局文件
│   │   ├── activity/   # Activity 布局
│   │   ├── tabs/       # Tab 页面布局
│   │   └── views/      # 视图布局
│   └── font/           # 字体 (仅 PC 调试用，Switch 使用系统字体)
└── library/            # Borealis 库 (子模块)
```

## 编译

```bash
# deko3d 渲染器 (默认，性能更好)
make

# OpenGL 渲染器
make OGL

# 清理构建目录
make clean
```

编译产物：
- `build_switch_D3D/项目名.nro` (deko3d)
- `build_switch_OGL/项目名.nro` (OpenGL)

## 使用模板

### 1. 修改项目信息

编辑 `CMakeLists.txt` 中的项目信息：

```cmake
project(你的项目名)
set(VERSION_MAJOR "1")
set(VERSION_MINOR "0")
set(VERSION_ALTER "0")
set(PROJECT_AUTHOR "你的名字")
set(PROJECT_ICON ${CMAKE_CURRENT_SOURCE_DIR}/resources/img/你的图标.jpg)
```

### 2. 修改代码结构

- `demo/src/main.cpp` - 程序入口，注册视图
- `demo/include/activity/` - 定义 Activity
- `demo/src/tab/` - 实现 Tab 页面
- `resources/xml/` - UI 布局文件

### 3. 替换资源

- `resources/img/demo_icon.jpg` - 应用图标 (256x256 JPG)
- `resources/i18n/` - 多语言文本
- `resources/xml/activity/main.xml` - 主界面布局

## 参考资料

- [borealis_template](https://github.com/xfangfang/borealis_template) - 原始模板
- [Borealis Wiki](https://github.com/xfangfang/borealis/wiki) - Borealis 文档
- [wiliwili](https://github.com/xfangfang/wiliwili) - 使用 Borealis 的完整项目示例
