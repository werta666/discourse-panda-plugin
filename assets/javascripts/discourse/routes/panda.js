import Route from "@ember/routing/route";
import { ajax } from "discourse/lib/ajax";

export default class PandaRoute extends Route {
  model() {
    return ajax("/panda.json");
  }
}
