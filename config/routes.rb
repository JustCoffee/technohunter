Rails.application.routes.draw do
 
  get 'home/terms'
  get 'home/companies'
  get 'home/about'
  get 'profile/show'

  match "/equips/new" => "equips#create", :via => "post"
  get 'equips/:id/update_cities' => 'equips#update_cities'
  get 'equips/update_cities' => 'equips#update_cities'
  get 'equips/update_marks_equip', as: 'update_marks_equip'
  get 'equips/:id/update_marks' => 'equips#update_marks_equip'
  post 'equips/bids/create', to: 'bids#create' 
  resources :equips

  match "/trucks/new" => "trucks#create", :via => "post"
  get 'trucks/:id/update_cities' => 'trucks#update_cities'
  get 'trucks/update_cities' => 'trucks#update_cities'
  get 'trucks/update_marks_truck', as: 'update_marks_truck'
  get 'trucks/:id/update_marks' => 'trucks#update_marks_truck'
  post 'trucks/bids/create', to: 'bids#create'
  resources :trucks

  match "/cars/new" => "cars#create", :via => "post"
  get 'cars/:id/update_cities' => 'cars#update_cities'
  get 'cars/update_cities' => 'cars#update_cities'
  post 'cars/bids/create', to: 'bids#create'
  get 'cars/update_marks', as: 'update_marks'
  get 'cars/:id/update_marks' => 'cars#update_marks'
  resources :cars

  get 'update_cities', to: 'search#update_cities', as: 'update_cities'
  get 'search/update_brands', to: 'search#update_brands', as: 'update_brands'
  get 'search/update_marks_search', to: 'search#update_marks_search', as: 'update_marks_search'
  get 'search/result'
  post 'search/result'

  post 'bids/:id' => 'bids#close', as: 'close_bid'



  get 'moderate/index'

  get 'home/index'

  post 'moderate/index', to: 'moderate#send_offer'
  post 'moderate/dell_offer', to: 'moderate#dell_offer'

  get 'offers/comment', to: 'offers#comment'
  post 'offers/add_comment', to: 'offers#add_comment'
  resources :offers

  resources :bids

  devise_for :users, :controllers => { :registrations => "users/registrations"}

  as :user do
    get "users/sign_up", to: "registrations#new", as: "new"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'offers#index'

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
