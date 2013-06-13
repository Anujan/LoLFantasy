LoLFantasy::Application.routes.draw do
  
  get "team/:id/sell/:player" => 'teams#sell', as: 'sell_player'
  get "team/:id/buy/:player" => 'teams#buy', as: 'buy_player'
  get "manage/:id" => 'teams#manage', as: 'manage_team'
  
  get "join/:league/" => 'teams#new', as: 'new_team'
  get "join/:league/:token" => 'teams#new', as: 'new_team_token'
  post "join/:league/" => 'teams#create', as: 'create_team'

  get "rankings" => "teams#rankings", as: 'rankings'  
  get "leagues/:league/rankings" => "leagues#rankings", as: 'league_rankings'
  
  resources :players
  resources :leagues
  resources :teams

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root "home#index"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
