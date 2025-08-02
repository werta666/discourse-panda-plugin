import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import DButton from "discourse/components/d-button";

export default class PandaCounter extends Component {
  @tracked count = 0;
  @tracked pandaEmojis = ["🐼", "🎋", "🌱", "🐾"];
  @tracked currentEmoji = "🐼";

  @action
  increment() {
    this.count++;
    this.currentEmoji = this.pandaEmojis[this.count % this.pandaEmojis.length];
  }

  @action
  reset() {
    this.count = 0;
    this.currentEmoji = "🐼";
  }

  <template>
    <div class="panda-counter">
      <h3>🐼 Panda Counter</h3>
      <div class="counter-display">
        <span class="emoji">{{this.currentEmoji}}</span>
        <span class="count">{{this.count}}</span>
      </div>
      <div class="counter-buttons">
        <DButton
          @action={{this.increment}}
          @label="Add Panda"
          @icon="plus"
          class="btn-primary"
        />
        <DButton
          @action={{this.reset}}
          @label="Reset"
          @icon="undo"
          class="btn-secondary"
        />
      </div>
    </div>

    <style>
      .panda-counter {
        background: white;
        border-radius: 10px;
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        margin: 20px 0;
      }

      .counter-display {
        margin: 20px 0;
      }

      .counter-display .emoji {
        font-size: 3rem;
        margin-right: 10px;
      }

      .counter-display .count {
        font-size: 2rem;
        font-weight: bold;
        color: #667eea;
      }

      .counter-buttons {
        display: flex;
        gap: 10px;
        justify-content: center;
      }
    </style>
  </template>
}
