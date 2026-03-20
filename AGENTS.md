# AGENTS.md — AutoHotkey v2 Scripts

## 快速参考

- **官方文档**: https://www.autohotkey.com/docs/v2/lib/index.htm
- **优先使用官方 API**，避免自行实现已有函数
- **运行脚本**: `AutoHotkey.exe main.ahk` 或使用 VS Code AHK++ 插件
- **无测试套件**，手动测试

## 代码规范

- 所有 `.ahk` 文件顶部必须 `#Requires AutoHotkey v2.0`
- 主入口脚本额外添加 `#SingleInstance Force`
- 使用 `#Include` 引入模块，路径相对于入口文件
- 热键修饰符: `^`=Ctrl `!`=Alt `#`=Win `+`=Shift `~`=穿透
- 字符串用双引号 `""`
- 注释用 `;`
- 使用 `ahk_exe` 识别窗口，如 `"ahk_exe code.exe"`
- 不使用 try/catch，用条件判断
- 4 空格缩进，`{` 与声明同列
