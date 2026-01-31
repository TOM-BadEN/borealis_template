# ============================================================================
# Switch 构建脚本
# ============================================================================
# 使用方法:
#   make        - 编译项目 (deko3d 渲染器)
#   make OGL    - 编译项目 (OpenGL 渲染器)
#   make clean  - 清理构建目录
# ============================================================================

.PHONY: all OGL clean

# 构建目录
BUILD_DIR = build_switch

# 自动从 CMakeLists.txt 读取项目名称
PROJECT_NAME = $(shell grep "^project(" CMakeLists.txt | sed 's/project(\([^)]*\)).*/\1/')

# 编译 (deko3d 渲染器，默认)
all:
	cmake -B $(BUILD_DIR)_D3D -DPLATFORM_SWITCH=ON -DUSE_DEKO3D=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make -C $(BUILD_DIR)_D3D $(PROJECT_NAME).nro -j$(nproc)

# 编译 (OpenGL 渲染器)
OGL:
	cmake -B $(BUILD_DIR)_OGL -DPLATFORM_SWITCH=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make -C $(BUILD_DIR)_OGL $(PROJECT_NAME).nro -j$(nproc)

# 清理
clean:
	rm -rf $(BUILD_DIR)_D3D $(BUILD_DIR)_OGL
