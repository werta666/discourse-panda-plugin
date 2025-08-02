# frozen_string_literal: true

# Parts of the core features examples can be skipped like so:
#   it_behaves_like "having working core features", skip_examples: %i[login likes]
#
# List of keywords for skipping examples:
# login, likes, profile, topics, topics:read, topics:reply, topics:create,
# search, search:quick_search, search:full_page
#
# For more details, see https://meta.discourse.org/t/-/361381
RSpec.describe "Core features", type: :system do
  before { enable_current_plugin }

  it_behaves_like "having working core features"
end

RSpec.describe "Panda Plugin", type: :system do
  before { enable_current_plugin }

  it "allows access to /panda page" do
    visit "/panda"
    expect(page).to have_content("Panda Paradise")
    expect(page).to have_content("Welcome to the amazing world of pandas!")
  end

  it "displays panda statistics" do
    visit "/panda"
    expect(page).to have_content("Panda Statistics")
    expect(page).to have_content("1864")
    expect(page).to have_content("Pandas Worldwide")
  end

  it "has interactive elements" do
    visit "/panda"
    expect(page).to have_content("Interactive Panda Zone")
    expect(page).to have_button("🐼 Tell me a panda fact!")
  end
end
