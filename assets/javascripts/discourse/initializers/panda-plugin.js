import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "panda-plugin",

  initialize() {
    console.log("🐼 Panda Plugin loaded successfully!");

    withPluginApi("1.0.0", (api) => {
      // Plugin initialization for Ember v5.12.0
      console.log("🐼 Panda Plugin API initialized");
    });
  }
};
