# hotfix
hotfix lua module

`Import` 代码参考 http://www.dpull.com/blog/2012-12-18-lua_utils

- 解决文件间的循环依赖
- 每个文件是一个独立的沙盒，不会污染全局变量
- 方便支持热更新

在这个基础上增加了两个功能
- `MEMVAR` 定义的数据不会被热更
- 支持模块末尾 `return M` 这种格式导出接口
