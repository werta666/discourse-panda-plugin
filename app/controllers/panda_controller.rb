# frozen_string_literal: true

class PandaController < ApplicationController
  requires_plugin PandaPluginModule::PLUGIN_NAME

  def index
    respond_to do |format|
      format.html { render_panda_page }
      format.json { render json: { message: "🐼 Panda Paradise", status: "working" } }
    end
  end

  private

  def render_panda_page
    render html: panda_html_content.html_safe
  end

  def panda_html_content
    <<~HTML
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>🐼 Panda Paradise</title>
          <style>
              body {
                  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                  margin: 0;
                  padding: 20px;
                  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                  min-height: 100vh;
                  color: white;
              }
              .container {
                  max-width: 800px;
                  margin: 0 auto;
                  text-align: center;
              }
              h1 {
                  font-size: 3rem;
                  margin-bottom: 20px;
                  text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
              }
              .card {
                  background: rgba(255,255,255,0.1);
                  padding: 30px;
                  border-radius: 15px;
                  margin: 20px 0;
                  backdrop-filter: blur(10px);
              }
              .stats {
                  background: white;
                  color: #333;
                  padding: 30px;
                  border-radius: 15px;
                  margin: 20px 0;
              }
              .btn {
                  background: rgba(255,255,255,0.2);
                  color: white;
                  border: none;
                  padding: 10px 20px;
                  border-radius: 20px;
                  cursor: pointer;
                  font-weight: bold;
                  margin: 10px;
                  transition: all 0.3s ease;
              }
              .btn:hover {
                  background: rgba(255,255,255,0.3);
                  transform: translateY(-2px);
              }
              .fact {
                  background: rgba(255,255,255,0.2);
                  padding: 15px;
                  border-radius: 10px;
                  margin-top: 20px;
                  display: none;
              }
          </style>
      </head>
      <body>
          <div class="container">
              <h1>🐼 Panda Paradise</h1>
              <p style="font-size: 1.2rem; margin-bottom: 40px;">Welcome to the amazing world of pandas!</p>

              <div class="stats">
                  <h2>🐼 Panda Statistics</h2>
                  <p><strong>Pandas Worldwide:</strong> 1,864</p>
                  <p><strong>Daily Bamboo Consumption:</strong> 12-38kg</p>
                  <p><strong>Conservation Status:</strong> Vulnerable</p>
              </div>

              <div class="card">
                  <h3>🎋 Interactive Panda Zone</h3>
                  <p>Click the button below to learn a random panda fact!</p>
                  <button class="btn" onclick="showFact()">🐼 Tell me a panda fact!</button>
                  <div id="fact" class="fact"></div>
              </div>

              <a href="/" class="btn" style="text-decoration: none; display: inline-block;">
                  ← Back to Forum
              </a>
          </div>

          <script>
              const facts = [
                  "🐼 Pandas spend 14-16 hours a day eating bamboo!",
                  "🎋 A panda's digestive system is actually designed for meat, but they evolved to eat bamboo.",
                  "🐼 Baby pandas are about the size of a stick of butter when born!",
                  "🎋 Pandas have a pseudo-thumb to help them grip bamboo.",
                  "🐼 Giant pandas can live up to 20 years in the wild and 30 years in captivity.",
                  "🎋 Pandas are excellent swimmers and climbers!"
              ];

              function showFact() {
                  const factDiv = document.getElementById('fact');
                  const randomFact = facts[Math.floor(Math.random() * facts.length)];
                  factDiv.textContent = randomFact;
                  factDiv.style.display = 'block';
              }
          </script>
      </body>
      </html>
    HTML
  end
end
