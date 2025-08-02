import Controller from "@ember/controller";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";

export default class PandaController extends Controller {
  @tracked randomFact = null;

  pandaFacts = [
    "🐼 Pandas spend 14-16 hours a day eating bamboo!",
    "🎋 A panda's digestive system is actually designed for meat, but they evolved to eat bamboo.",
    "🐼 Baby pandas are about the size of a stick of butter when born!",
    "🎋 Pandas have a pseudo-thumb to help them grip bamboo.",
    "🐼 Giant pandas can live up to 20 years in the wild and 30 years in captivity.",
    "🎋 Pandas are excellent swimmers and climbers!",
    "🐼 A panda's black and white coloring helps them blend into their environment.",
    "🎋 Pandas communicate through scent marking and vocalizations."
  ];

  @action
  showRandomFact() {
    const randomIndex = Math.floor(Math.random() * this.pandaFacts.length);
    this.randomFact = this.pandaFacts[randomIndex];
  }
}
