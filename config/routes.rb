Rails.application.routes.draw do

  # Main Pages ( Welcome Controller )
  root 'welcome#index'
  match '/about', to: 'welcome#about', via: 'get'
  match '/help', to: 'welcome#help', via: 'get'

  # Session Management
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  # Activation ( Email Varification )
  match '/activate/:activation_token', to: 'users#activate_user', via: 'get', as: 'activate'
  match '/resend_activation_email', to: 'users#resend_activation_email', via: 'post'

  # Profile
  match '/profile', to: 'users#show', via: 'get'

  # Edit Profiles
  match '/profile/edit', to: 'users#edit', via: 'get'
  match '/profile/edit', to: 'users#update', via: 'post'

  match '/profile/edit/email', to: 'users#edit_email', via: 'get'
  match '/profile/edit/email', to: 'users#update_email', via: 'post'

  match '/profile/edit/password', to: 'users#edit_password', via: 'get'
  match '/profile/edit/password', to: 'users#update_password', via: 'post'

  match '/forgot_password', to: 'users#forgot_password', via: 'get'
  match '/reset_password', to: 'users#reset_password', via: 'post'

  # Proposals ( 건의사항 )
  match '/proposal/new', to: 'proposals#new', via: 'get'
  match '/proposal/:proposal_id/reply', to: 'proposals#reply', via: 'get', as: 'reply_proposal'
  match '/proposal/:proposal_id/reply', to: 'proposals#update_reply', via: 'post'

  resources :users, only: [:index, :create]
  resources :sessions, only: [:create]
  resources :proposals, only: [:create]

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
