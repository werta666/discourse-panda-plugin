# 🔧 Discourse 熊猫插件技术实现指南

本文档详细说明了如何成功实现一个在 Discourse 中可访问的 `/panda` 路由，经过多次调试和优化后的最终解决方案。

## 🎯 最终成功的实现方案

经过多次尝试和调试，最终成功的关键在于使用 **Rails Engine 架构** + **Ember v5.12.0 现代化前端**。

## 📋 核心文件结构

### 1. 插件主配置文件 (`plugin.rb`)

```ruby
# frozen_string_literal: true

# name: discourse-panda-plugin
# about: A Panda-themed plugin that adds a custom /panda page with interactive content
# meta_topic_id: TODO
# version: 0.0.1
# authors: Panda_CC
# url: TODO
# required_version: 2.7.0

enabled_site_setting :panda_plugin_enabled

# Register assets for Ember v5.12.0
register_asset "stylesheets/panda-plugin.scss"

module ::PandaPluginModule
  PLUGIN_NAME = "discourse-panda-plugin"
end

require_relative "lib/panda_plugin_module/engine"

after_initialize do
  # 挂载 Engine 到 /panda 路径
  Discourse::Application.routes.append do
    mount ::PandaPluginModule::Engine, at: "/panda"
  end
end
```

**关键点**:
- 使用 `mount ::PandaPluginModule::Engine, at: "/panda"` 挂载 Engine
- 注册 SCSS 样式文件
- 在 `after_initialize` 中进行路由注册

### 2. Rails Engine 配置 (`lib/panda_plugin_module/engine.rb`)

```ruby
# frozen_string_literal: true

module ::PandaPluginModule
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace PandaPluginModule
    config.autoload_paths << File.join(config.root, "lib")
  end
end
```

**关键点**:
- 继承 `::Rails::Engine`
- 使用 `isolate_namespace` 隔离命名空间
- 配置自动加载路径

### 3. 路由配置 (`config/routes.rb`)

```ruby
# frozen_string_literal: true

PandaPluginModule::Engine.routes.draw do
  get "/" => "panda#index"
end
```

**关键点**:
- 在 Engine 内部定义路由
- 简洁的路由配置，只保留核心功能

### 4. 后端控制器 (`app/controllers/panda_plugin_module/panda_controller.rb`)

```ruby
# frozen_string_literal: true

module ::PandaPluginModule
  class PandaController < ::ApplicationController
    requires_plugin PandaPluginModule::PLUGIN_NAME

    def index
      Rails.logger.info "🐼 Panda Controller accessed!"

      # Bootstrap the Ember app for /panda route
      render "default/empty"
    rescue => e
      Rails.logger.error "🐼 Panda Error: #{e.message}"
      render plain: "Error: #{e.message}", status: 500
    end
  end
end
```

**关键点**:
- 继承 `::ApplicationController`
- 使用 `requires_plugin` 确保插件启用
- 渲染 `"default/empty"` 来引导 Ember 应用
- 添加错误处理和日志记录

## 🎨 前端 Ember v5.12.0 实现

### 1. 路由映射 (`assets/javascripts/discourse/panda-route-map.js`)

```javascript
// Modern Ember v5+ route mapping
export default function () {
  this.route("panda", { path: "/panda" });
}
```

### 2. 路由处理器 (`assets/javascripts/discourse/routes/panda.js`)

```javascript
import Route from "@ember/routing/route";

export default class PandaRoute extends Route {
  model() {
    return {
      message: "🐼 Panda Paradise",
      status: "working",
      time: new Date().toLocaleString(),
      ember_version: "v5.12.0",
      plugin_version: "0.0.1"
    };
  }
}
```

### 3. 控制器逻辑 (`assets/javascripts/discourse/controllers/panda.js`)

```javascript
import Controller from "@ember/controller";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";

export default class PandaController extends Controller {
  @tracked randomFact = null;

  pandaFacts = [
    "🐼 Pandas spend 14-16 hours a day eating bamboo!",
    // ... 更多熊猫知识
  ];

  @action
  showRandomFact() {
    const randomIndex = Math.floor(Math.random() * this.pandaFacts.length);
    this.randomFact = this.pandaFacts[randomIndex];
  }
}
```

### 4. 模板文件 (`assets/javascripts/discourse/templates/panda.hbs`)

```handlebars
<div class="panda-page">
  <div class="panda-header">
    <h1>🐼 {{model.message}}</h1>
    <p>Status: {{model.status}}</p>
  </div>
  
  <div class="panda-content">
    <div class="panda-card">
      <h2>🎋 Welcome to Panda Paradise!</h2>
      
      <button class="btn btn-primary panda-btn" {{on "click" this.showRandomFact}}>
        🐼 Show Random Fact
      </button>
      
      {{#if this.randomFact}}
        <div class="panda-fact">
          {{this.randomFact}}
        </div>
      {{/if}}
    </div>
  </div>
  
  <div class="panda-footer">
    <LinkTo @route="discovery.latest" class="btn btn-default">
      ← Back to Forum
    </LinkTo>
  </div>
</div>
```

## 🚫 失败的尝试和教训

### 1. 直接路由注册 (❌ 失败)

```ruby
# 这种方式不工作
Discourse::Application.routes.append do
  get '/panda' => 'panda#index'
end
```

**问题**: 控制器无法正确加载，路由无法找到对应的控制器。

### 2. 错误的控制器继承 (❌ 失败)

```ruby
# 错误的继承方式
class PandaController < ActionController::Base
```

**问题**: 缺少 Discourse 的安全检查和上下文，导致渲染失败。

### 3. 复杂的 Rails Engine 配置 (❌ 过度复杂)

最初尝试了过于复杂的 Engine 配置，包括多个路由和不必要的功能，导致调试困难。

## ✅ 成功的关键因素

### 1. 正确的架构选择
- **Rails Engine**: 提供了完整的 MVC 架构支持
- **命名空间隔离**: 避免与 Discourse 核心代码冲突
- **模块化设计**: 便于维护和扩展

### 2. 现代化的 Ember 实现
- **ES6+ 语法**: 使用 class 和装饰器
- **响应式状态管理**: 使用 `@tracked` 装饰器
- **现代模板语法**: 使用 `{{on}}` 和 `<LinkTo>`

### 3. 简洁的设计原则
- **单一职责**: 每个文件只负责一个功能
- **最小化配置**: 只保留必要的配置和路由
- **清晰的错误处理**: 完善的日志记录和错误处理

## 🔍 调试技巧

### 1. 日志记录
```ruby
Rails.logger.info "🐼 Panda Controller accessed!"
```

### 2. 浏览器控制台
```javascript
console.log("🐼 Panda Plugin loaded successfully!");
```

### 3. 路由检查
访问 `/rails/info/routes` 查看所有注册的路由。

## 🎯 最佳实践

1. **使用 Rails Engine** 而不是直接路由注册
2. **正确继承 ApplicationController** 获得完整的 Discourse 上下文
3. **使用现代 Ember 语法** 确保与最新版本兼容
4. **添加完善的错误处理** 便于调试和维护
5. **保持代码简洁** 只实现必要的功能

## 🚀 部署检查清单

- [ ] 插件文件结构正确
- [ ] Rails Engine 正确配置
- [ ] 路由正确注册
- [ ] 控制器正确继承
- [ ] Ember 路由映射正确
- [ ] 样式文件正确注册
- [ ] 插件设置正确配置
- [ ] 重启 Discourse 服务器
- [ ] 访问 `/panda` 测试功能

---

通过以上的技术实现，最终成功创建了一个完全可用的 `/panda` 路由，提供了完整的 Ember 单页应用体验。关键在于正确使用 Rails Engine 架构和现代化的 Ember v5.12.0 实现。
