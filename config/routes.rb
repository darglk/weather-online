Rails.application.routes.draw do
  devise_for :users
  root 'arduino_sensors#index'
  resources :arduino_sensors, :only => [:index]
  namespace :api do
    resources :arduino_sensors, :only => [:create, :show, :index]

    mount_devise_token_auth_for 'User', at: 'auth'
    get 'today' => 'arduino_sensors#today'
    get 'yesterday' => 'arduino_sensors#yesterday'
    get 'this_month' => 'arduino_sensors#this_month'
    get 'this_year' => 'arduino_sensors#this_year'
  end

  get 'today' => 'arduino_sensors#today'
  get 'yesterday' => 'arduino_sensors#yesterday'
  get 'this_month' => 'arduino_sensors#this_month'
  get 'this_year' => 'arduino_sensors#this_year'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
