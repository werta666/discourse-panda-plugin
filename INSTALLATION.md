# 🐼 Panda Plugin Installation Guide

## Quick Start

1. **Copy the plugin** to your Discourse `plugins` directory:
   ```bash
   cd /var/discourse/plugins
   git clone <your-repo-url> discourse-panda-plugin
   ```

2. **Rebuild Discourse**:
   ```bash
   cd /var/discourse
   ./launcher rebuild app
   ```

3. **Enable the plugin**:
   - Go to Admin → Plugins
   - Find "Discourse Panda Plugin"
   - Enable it

4. **Visit the panda page**:
   - Navigate to `yoursite.com/panda`
   - Enjoy the panda paradise! 🐼

## Features Included

### 🎨 Frontend Features
- **Modern Glimmer Components**: Uses the latest `.gjs` component format
- **Responsive Design**: Beautiful gradient design that works on all devices
- **Interactive Elements**: Click buttons to learn panda facts
- **Navigation Integration**: Adds panda link to hamburger menu and header

### ⚙️ Backend Features
- **Rails Engine Architecture**: Clean, modular backend structure
- **RESTful API**: JSON endpoints at `/panda/api`
- **Custom Controllers**: Dedicated panda controller with multiple actions
- **Settings Integration**: Admin-configurable plugin settings

### 🧪 Testing & Quality
- **System Tests**: RSpec tests for core functionality
- **JavaScript Tests**: QUnit tests for frontend components
- **Code Quality**: ESLint and Stylelint configurations
- **Modern Standards**: Follows latest Discourse plugin development practices

## API Endpoints

- `GET /panda` - Main panda page (HTML)
- `GET /panda.json` - Panda data (JSON)
- `GET /panda/api` - API endpoint for panda data

## Configuration

The plugin can be configured in Admin → Settings → Plugins:

- **panda_plugin_enabled**: Enable/disable the plugin (default: true)

## Development

This plugin demonstrates modern Discourse plugin development:

### Modern JavaScript Features
- ES6+ modules and syntax
- Glimmer components with `.gjs` format
- Modern API usage (apiInitializer, registerValueTransformer)
- Responsive CSS with modern features

### Backend Architecture
- Rails Engine pattern
- Modular controller structure
- RESTful API design
- Proper namespace organization

### Testing Strategy
- System tests for integration testing
- JavaScript tests for frontend components
- Comprehensive test coverage

## Customization

You can customize the plugin by:

1. **Modifying the panda data** in `app/controllers/panda_plugin_module/panda_controller.rb`
2. **Updating styles** in `assets/stylesheets/common/panda-plugin.scss`
3. **Adding new features** using the established patterns
4. **Extending the API** by adding new controller actions

## Troubleshooting

### Plugin not showing up
- Ensure the plugin is in the correct directory
- Check that the rebuild completed successfully
- Verify the plugin is enabled in Admin → Plugins

### /panda page not accessible
- Check that the plugin is enabled
- Verify the routes are properly configured
- Check browser console for JavaScript errors

### Styling issues
- Clear browser cache
- Check for CSS conflicts with your theme
- Verify SCSS compilation completed successfully

## Support

This plugin is built using the latest Discourse plugin development practices and serves as an excellent example for learning modern plugin development.

For more information about Discourse plugin development:
- [Official Plugin Development Guide](https://meta.discourse.org/t/developing-discourse-plugins-part-1-create-a-basic-plugin/30515)
- [Modern API Documentation](https://meta.discourse.org/t/using-transformers-to-customize-client-side-values-and-behavior/349954)
- [Glimmer Component Migration](https://meta.discourse.org/t/upcoming-post-menu-changes-how-to-prepare-themes-and-plugins/341014)
