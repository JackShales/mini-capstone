Rails.application.routes.draw do
  get '/' => 'drinks#index'
  get '/drinks' => 'drinks#index'
  get '/drinks/new' => 'drinks#new'
  get '/drinks/discount' => 'drinks#discount'
  post '/drinks' => 'drinks#create'
  get '/drinks/:id' => 'drinks#show'
  get 'drinks/:id/edit' => 'drinks#edit'
  patch '/drinks/:id' => 'drinks#update'
  delete '/drinks/:id' => 'drinks#destroy'
  # image routes
  get '/images/:id/new' => 'images#new'
  post '/images' => 'images#create'
  # authentication routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # order routes
  post '/orders/' => 'orders#create'
  get '/orders/:id/' => 'orders#show'
  # cart routes
  get '/cart' => 'carted_products#index'
  post '/cart/:id' => 'carted_products#create'
  delete '/cart' => 'carted_products#destroy'

 
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
