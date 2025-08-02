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
