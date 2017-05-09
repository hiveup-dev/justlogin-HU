Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :products do
    resources :products, :path => '', :only => [:index, :show] do
      collection do
        get :compare
      end
    end
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
    resources :plans, :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/products" do
      resources :plans, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :products do
    resources :user_submitions, :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/products" do
      resources :user_submitions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :products do
    resources :user_submissions, :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/products" do
      resources :user_submissions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
