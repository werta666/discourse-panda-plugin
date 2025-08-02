# frozen_string_literal: true

module ::PandaPluginModule
  class PandaController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    layout false
    skip_before_action :verify_authenticity_token

    def index
      # Simple debug first
      Rails.logger.info "🐼 Panda Controller accessed"

      # Check if plugin is enabled
      unless SiteSetting.panda_plugin_enabled
        render plain: "Panda Plugin is disabled. Please enable it in Admin → Settings → Plugins", status: 403
        return
      end

      @panda_data = get_panda_data
      Rails.logger.info "🐼 Panda data loaded: #{@panda_data.keys}"

      respond_to do |format|
        format.html {
          Rails.logger.info "🐼 Rendering HTML"
          render_panda_page
        }
        format.json {
          Rails.logger.info "🐼 Rendering JSON"
          render json: @panda_data
        }
      end
    rescue => e
      Rails.logger.error "🐼 Panda Plugin Error: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      render plain: "Error: #{e.message}", status: 500
    end

    def api_data
      render json: get_panda_data
    rescue => e
      Rails.logger.error "Panda API Error: #{e.message}"
      render json: { error: e.message }, status: 500
    end

    private

    def get_panda_data
      {
        title: "🐼 Panda Paradise",
        subtitle: "Welcome to the amazing world of pandas!",
        features: [
          {
            title: "Cute Pandas",
            description: "Discover the most adorable pandas from around the world",
            icon: "🐼"
          },
          {
            title: "Bamboo Facts",
            description: "Learn interesting facts about bamboo and panda diet",
            icon: "🎋"
          },
          {
            title: "Conservation",
            description: "Support panda conservation efforts worldwide",
            icon: "🌱"
          }
        ],
        stats: {
          pandas_worldwide: 1864,
          bamboo_consumed_daily: "12-38kg",
          conservation_status: "Vulnerable"
        }
      }
    end

    def render_panda_page
      # Very simple test to ensure it works
      render plain: "🐼 Panda Paradise is working! Plugin is enabled and responding."
    end

    def panda_html_content
      <<~HTML
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>#{@panda_data[:title]} - #{SiteSetting.title}</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }
                
                body {
                    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                    line-height: 1.6;
                    color: #333;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                }
                
                .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 20px;
                }
                
                .header {
                    text-align: center;
                    color: white;
                    margin-bottom: 40px;
                    padding: 40px 0;
                }
                
                .header h1 {
                    font-size: 3.5rem;
                    margin-bottom: 10px;
                    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
                }
                
                .header p {
                    font-size: 1.2rem;
                    opacity: 0.9;
                }
                
                .features {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                    gap: 30px;
                    margin-bottom: 50px;
                }
                
                .feature-card {
                    background: white;
                    border-radius: 15px;
                    padding: 30px;
                    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                    text-align: center;
                }
                
                .feature-card:hover {
                    transform: translateY(-10px);
                    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
                }
                
                .feature-icon {
                    font-size: 4rem;
                    margin-bottom: 20px;
                    display: block;
                }
                
                .feature-title {
                    font-size: 1.5rem;
                    font-weight: bold;
                    margin-bottom: 15px;
                    color: #2c3e50;
                }
                
                .feature-description {
                    color: #666;
                    line-height: 1.6;
                }
                
                .stats {
                    background: rgba(255,255,255,0.95);
                    border-radius: 15px;
                    padding: 40px;
                    margin-bottom: 40px;
                    backdrop-filter: blur(10px);
                }
                
                .stats h2 {
                    text-align: center;
                    margin-bottom: 30px;
                    color: #2c3e50;
                    font-size: 2rem;
                }
                
                .stats-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 30px;
                    text-align: center;
                }
                
                .stat-item {
                    padding: 20px;
                }
                
                .stat-number {
                    font-size: 2.5rem;
                    font-weight: bold;
                    color: #667eea;
                    display: block;
                    margin-bottom: 10px;
                }
                
                .stat-label {
                    color: #666;
                    font-size: 1rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }
                
                .back-link {
                    text-align: center;
                    margin-top: 40px;
                }
                
                .back-link a {
                    display: inline-block;
                    background: rgba(255,255,255,0.2);
                    color: white;
                    padding: 15px 30px;
                    border-radius: 50px;
                    text-decoration: none;
                    font-weight: bold;
                    transition: all 0.3s ease;
                    backdrop-filter: blur(10px);
                    border: 2px solid rgba(255,255,255,0.3);
                }
                
                .back-link a:hover {
                    background: rgba(255,255,255,0.3);
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
                }
                
                .interactive-section {
                    background: rgba(255,255,255,0.95);
                    border-radius: 15px;
                    padding: 40px;
                    margin-bottom: 40px;
                    text-align: center;
                }
                
                .panda-button {
                    background: linear-gradient(45deg, #667eea, #764ba2);
                    color: white;
                    border: none;
                    padding: 15px 30px;
                    border-radius: 50px;
                    font-size: 1.1rem;
                    font-weight: bold;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    margin: 10px;
                }
                
                .panda-button:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(0,0,0,0.2);
                }
                
                .panda-fact {
                    background: #f8f9fa;
                    border-left: 4px solid #667eea;
                    padding: 20px;
                    margin: 20px 0;
                    border-radius: 0 10px 10px 0;
                    display: none;
                }
                
                @media (max-width: 768px) {
                    .header h1 {
                        font-size: 2.5rem;
                    }
                    
                    .features {
                        grid-template-columns: 1fr;
                    }
                    
                    .stats-grid {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h1>#{@panda_data[:title]}</h1>
                    <p>#{@panda_data[:subtitle]}</p>
                </div>
                
                <div class="features">
                    #{render_features}
                </div>
                
                <div class="stats">
                    <h2>🐼 Panda Statistics</h2>
                    <div class="stats-grid">
                        <div class="stat-item">
                            <span class="stat-number">#{@panda_data[:stats][:pandas_worldwide]}</span>
                            <span class="stat-label">Pandas Worldwide</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">#{@panda_data[:stats][:bamboo_consumed_daily]}</span>
                            <span class="stat-label">Bamboo Daily</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">#{@panda_data[:stats][:conservation_status]}</span>
                            <span class="stat-label">Status</span>
                        </div>
                    </div>
                </div>
                
                <div class="interactive-section">
                    <h2>🎋 Interactive Panda Zone</h2>
                    <p>Click the button below to learn a random panda fact!</p>
                    <button class="panda-button" onclick="showRandomFact()">🐼 Tell me a panda fact!</button>
                    <div id="panda-fact" class="panda-fact"></div>
                </div>
                
                <div class="back-link">
                    <a href="/">← Back to #{SiteSetting.title}</a>
                </div>
            </div>
            
            <script>
                const pandaFacts = [
                    "🐼 Pandas spend 14-16 hours a day eating bamboo!",
                    "🎋 A panda's digestive system is actually designed for meat, but they evolved to eat bamboo.",
                    "🐼 Baby pandas are about the size of a stick of butter when born!",
                    "🎋 Pandas have a pseudo-thumb to help them grip bamboo.",
                    "🐼 Giant pandas can live up to 20 years in the wild and 30 years in captivity.",
                    "🎋 Pandas are excellent swimmers and climbers!",
                    "🐼 A panda's black and white coloring helps them blend into their environment.",
                    "🎋 Pandas communicate through scent marking and vocalizations."
                ];
                
                function showRandomFact() {
                    const factElement = document.getElementById('panda-fact');
                    const randomFact = pandaFacts[Math.floor(Math.random() * pandaFacts.length)];
                    factElement.textContent = randomFact;
                    factElement.style.display = 'block';
                    
                    // Add a little animation
                    factElement.style.opacity = '0';
                    factElement.style.transform = 'translateY(20px)';
                    
                    setTimeout(() => {
                        factElement.style.transition = 'all 0.5s ease';
                        factElement.style.opacity = '1';
                        factElement.style.transform = 'translateY(0)';
                    }, 100);
                }
                
                // Add some interactive effects
                document.addEventListener('DOMContentLoaded', function() {
                    const cards = document.querySelectorAll('.feature-card');
                    cards.forEach(card => {
                        card.addEventListener('mouseenter', function() {
                            this.style.transform = 'translateY(-10px) scale(1.02)';
                        });
                        
                        card.addEventListener('mouseleave', function() {
                            this.style.transform = 'translateY(0) scale(1)';
                        });
                    });
                });
            </script>
        </body>
        </html>
      HTML
    end

    def render_features
      @panda_data[:features].map do |feature|
        <<~HTML
          <div class="feature-card">
              <span class="feature-icon">#{feature[:icon]}</span>
              <h3 class="feature-title">#{feature[:title]}</h3>
              <p class="feature-description">#{feature[:description]}</p>
          </div>
        HTML
      end.join
    end
  end
end
