Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :messages do
    resources :messages, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :messages, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :messages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
