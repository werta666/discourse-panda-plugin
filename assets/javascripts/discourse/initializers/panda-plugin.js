import { withPluginApi } from "discourse/lib/plugin-api";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.34.0", (api) => {
  // Add navigation item to the hamburger menu using modern API
  api.decorateWidget("hamburger-menu:footerLinks", () => {
    if (api.getCurrentUser()) {
      return {
        href: "/panda",
        rawLabel: "🐼 Panda Paradise",
        className: "panda-menu-link"
      };
    }
  });

  // Add custom CSS for the menu link
  api.onPageChange(() => {
    if (!document.querySelector('#panda-menu-styles')) {
      const style = document.createElement('style');
      style.id = 'panda-menu-styles';
      style.textContent = `
        .panda-menu-link {
          color: #667eea !important;
          font-weight: bold;
        }
        .panda-menu-link:hover {
          background-color: rgba(102, 126, 234, 0.1) !important;
          color: #764ba2 !important;
        }
      `;
      document.head.appendChild(style);
    }
  });

  // Register a custom transformer for demonstration
  api.registerValueTransformer("home-logo-href", ({ value, context }) => {
    // This is just an example - you could modify the logo link behavior
    return value;
  });

  // Add a custom site header button (modern approach)
  api.headerIcons.add("panda-link", {
    href: "/panda",
    title: "Visit Panda Paradise",
    text: "🐼",
    id: "panda-header-link"
  });

  // Optional: Add a notification when plugin is loaded
  console.log("🐼 Panda Plugin loaded successfully with modern APIs!");
});
