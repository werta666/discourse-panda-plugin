# 🐼 Discourse 熊猫插件

一个为 Discourse 论坛添加自定义熊猫主题页面的现代化插件，基于 Ember v5.12.0 构建。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Discourse Version](https://img.shields.io/badge/Discourse-v2.7.0+-blue.svg)](https://www.discourse.org/)
[![Ember Version](https://img.shields.io/badge/Ember-v5.12.0-orange.svg)](https://emberjs.com/)

## ✨ 特性

- 🎯 **单页应用体验** - 完整的 Ember v5.12.0 单页应用
- 🎨 **现代化设计** - 渐变背景、平滑动画和响应式布局
- 🐼 **交互式内容** - 随机熊猫知识展示功能
- 📱 **移动端友好** - 完全响应式设计，支持各种设备
- ⚡ **高性能** - 优化的资源加载和渲染性能
- 🛠️ **易于配置** - 简单的插件设置和管理

## 🚀 快速开始

### 安装步骤

1. **下载插件**
   ```bash
   cd /var/discourse/containers/app/plugins
   git clone https://github.com/your-username/discourse-panda-plugin.git
   ```

2. **重建容器**
   ```bash
   cd /var/discourse
   ./launcher rebuild app
   ```

3. **启用插件**
   - 访问 `管理员 → 插件`
   - 找到 "discourse-panda-plugin" 并启用
   - 在 `管理员 → 设置 → 插件` 中配置相关设置

### 使用方法

访问您的 Discourse 站点的 `/panda` 路径即可体验完整的熊猫主题单页应用！

## 🎯 功能展示

- **🐼 熊猫乐园主页** - 精美的欢迎界面
- **📊 熊猫统计数据** - 全球熊猫保护相关信息
- **🎋 随机知识** - 点击按钮获取有趣的熊猫知识
- **🔗 无缝导航** - 与论坛主站的完美集成

## 🛠️ 技术栈

- **后端**: Ruby on Rails + Discourse API
- **前端**: Ember.js v5.12.0
- **样式**: SCSS + 现代 CSS 特性
- **架构**: Rails Engine + 模块化设计

## 📁 项目结构

```
discourse-panda-plugin/
├── 📄 plugin.rb                           # 插件主配置文件
├── 🏗️ lib/panda_plugin_module/engine.rb   # Rails Engine
├── 🎮 app/controllers/                     # 后端控制器
│   └── panda_plugin_module/
│       └── panda_controller.rb
├── 🛣️ config/
│   ├── routes.rb                          # 路由配置
│   └── settings.yml                       # 插件设置
└── 🎨 assets/
    ├── javascripts/discourse/             # Ember 前端代码
    │   ├── panda-route-map.js            # 路由映射
    │   ├── routes/panda.js               # 路由处理器
    │   ├── controllers/panda.js          # 控制器逻辑
    │   ├── templates/panda.hbs           # 模板文件
    │   └── initializers/panda-plugin.js  # 初始化器
    └── stylesheets/
        └── panda-plugin.scss             # 样式文件
```

## ⚙️ 配置选项

| 设置项 | 描述 | 默认值 |
|--------|------|--------|
| `panda_plugin_enabled` | 启用熊猫插件 | `true` |

## 🔧 开发指南

### 本地开发环境

1. **克隆 Discourse 开发环境**
2. **将插件链接到开发环境**
   ```bash
   ln -s /path/to/discourse-panda-plugin /path/to/discourse/plugins/
   ```
3. **启动开发服务器**
   ```bash
   bundle exec rails server
   ```

### 自定义修改

- **修改样式**: 编辑 `assets/stylesheets/panda-plugin.scss`
- **添加功能**: 在 `assets/javascripts/discourse/controllers/panda.js` 中扩展
- **修改模板**: 编辑 `assets/javascripts/discourse/templates/panda.hbs`

## 🤝 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📝 更新日志

### v0.0.1 (2025-01-28)
- 🎉 初始版本发布
- ✅ 完整的 Ember v5.12.0 单页应用
- 🎨 现代化 UI 设计
- 🐼 交互式熊猫知识功能

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🙏 致谢

- [Discourse](https://www.discourse.org/) - 优秀的论坛平台
- [Ember.js](https://emberjs.com/) - 强大的前端框架
- 所有为熊猫保护事业做出贡献的组织和个人

## 📞 支持

如果您遇到任何问题或有建议，请：

- 🐛 [提交 Issue](https://github.com/your-username/discourse-panda-plugin/issues)
- 💬 在 Discourse Meta 社区讨论
- 📧 联系维护者

---

<div align="center">
  <strong>🐼 让我们一起保护可爱的熊猫！🎋</strong>
</div>
