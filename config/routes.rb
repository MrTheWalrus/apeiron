Rails.application.routes.draw do
  resources :admin, only: [:index] do
    collection do
      post :crisis
    end
  end

  resources :missions

  resources :projects

  resources :resources

  resources :events

  resources :factions

  get "intel/home"

  get "systems/overview"
  get "systems/power"
  get "systems/structural"
  get "systems/information"
  get "systems/defensive"
  get "systems/offensive"
  get "systems/transit"
  get "systems/environmental"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
end
