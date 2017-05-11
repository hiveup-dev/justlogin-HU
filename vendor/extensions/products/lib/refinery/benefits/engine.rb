module Refinery
  module Products
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Products

      engine_name :refinery_products

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "benefits"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.products_admin_benefits_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/products/benefits(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Benefits)
      end
    end
  end
end
