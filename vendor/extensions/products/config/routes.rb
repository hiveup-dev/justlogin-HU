Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :products do
    resources :products, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :products, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :products do
    resources :product_features, :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/products" do
      resources :product_features, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :products do
    resources :product_features_products, :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/products" do
      resources :product_features_products, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
