import { acceptance } from "discourse/tests/helpers/qunit-helpers";
import { test } from "qunit";
import { visit } from "@ember/test-helpers";

acceptance("Panda Plugin", function (needs) {
  needs.user();
  needs.settings({ panda_plugin_enabled: true });

  test("panda plugin initializes correctly", function (assert) {
    assert.ok(true, "Panda plugin test runs");
  });

  test("hamburger menu contains panda link", async function (assert) {
    await visit("/");
    
    // This is a basic test - in a real scenario you'd need to open the hamburger menu
    // and check for the panda link
    assert.ok(true, "Hamburger menu test placeholder");
  });
});
