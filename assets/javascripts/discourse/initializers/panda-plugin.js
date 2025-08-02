import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "panda-plugin",

  initialize() {
    // Minimal initialization - only log to avoid any conflicts
    console.log("🐼 Panda Plugin loaded successfully!");

    // Temporarily disable all widget decorations to test
    // withPluginApi("1.34.0", (api) => {
    //   // Hamburger menu link will be added later after testing
    // });
  }
};
