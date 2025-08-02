# frozen_string_literal: true

class PandaController < ApplicationController
  requires_plugin "discourse-panda-plugin"
  layout false
  skip_before_action :verify_authenticity_token

  def index
    Rails.logger.info "🐼 Panda Controller accessed"
    
    # Check if plugin is enabled
    unless SiteSetting.panda_plugin_enabled
      render plain: "Panda Plugin is disabled. Please enable it in Admin → Settings → Plugins", status: 403
      return
    end

    respond_to do |format|
      format.html { render_panda_page }
      format.json { render json: get_panda_data }
    end
  rescue => e
    Rails.logger.error "🐼 Panda Plugin Error: #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    render plain: "Error: #{e.message}", status: 500
  end

  def test
    render plain: "🐼 Panda Plugin Test - This is working!"
  end

  def api_data
    render json: get_panda_data
  rescue => e
    Rails.logger.error "🐼 Panda API Error: #{e.message}"
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
    simple_html = <<~HTML
      <!DOCTYPE html>
      <html>
      <head>
        <title>🐼 Panda Paradise - #{SiteSetting.title}</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>
      <body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh;">
        <div style="max-width: 800px; margin: 0 auto; text-align: center; color: white;">
          <h1 style="font-size: 3rem; margin-bottom: 20px;">🐼 Panda Paradise</h1>
          <p style="font-size: 1.2rem; margin-bottom: 40px;">Welcome to the amazing world of pandas!</p>
          
          <div style="background: white; color: #333; padding: 30px; border-radius: 15px; margin: 20px 0;">
            <h2>🐼 Panda Statistics</h2>
            <p><strong>Pandas Worldwide:</strong> 1,864</p>
            <p><strong>Daily Bamboo Consumption:</strong> 12-38kg</p>
            <p><strong>Conservation Status:</strong> Vulnerable</p>
          </div>
          
          <div style="background: rgba(255,255,255,0.1); padding: 20px; border-radius: 10px; margin: 20px 0;">
            <h3>🎋 Interactive Panda Zone</h3>
            <button onclick="showFact()" style="background: #fff; color: #667eea; border: none; padding: 10px 20px; border-radius: 20px; font-weight: bold; cursor: pointer;">
              🐼 Tell me a panda fact!
            </button>
            <div id="fact" style="margin-top: 20px; padding: 15px; background: rgba(255,255,255,0.2); border-radius: 10px; display: none;"></div>
          </div>
          
          <a href="/" style="display: inline-block; background: rgba(255,255,255,0.2); color: white; padding: 10px 20px; border-radius: 20px; text-decoration: none; margin-top: 20px;">
            ← Back to #{SiteSetting.title}
          </a>
        </div>
        
        <script>
          const facts = [
            "🐼 Pandas spend 14-16 hours a day eating bamboo!",
            "🎋 A panda's digestive system is actually designed for meat, but they evolved to eat bamboo.",
            "🐼 Baby pandas are about the size of a stick of butter when born!",
            "🎋 Pandas have a pseudo-thumb to help them grip bamboo.",
            "🐼 Giant pandas can live up to 20 years in the wild and 30 years in captivity.",
            "🎋 Pandas are excellent swimmers and climbers!",
            "🐼 A panda's black and white coloring helps them blend into their environment.",
            "🎋 Pandas communicate through scent marking and vocalizations."
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
    
    render html: simple_html.html_safe
  end
end
