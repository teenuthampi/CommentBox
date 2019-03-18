Rails.application.routes.draw do
 devise_for :users
   devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  get '/trash', to: 'pages#trash'
  match '/posts/trashposts/:id' => 'posts#trashposts', :via => [:get,:delete, :post], :as => :trashposts
  match '/comments/comment_trash/:id' => 'comments#comment_trash', :via => [:get,:delete, :post], :as => :comment_trash
  match '/posts/restore/:id' => 'posts#restore', :via => [:get,:delete, :post], :as => :restore
  match '/comments/comment_restore/:id' => 'comments#comment_restore', :via => [:get,:delete, :post], :as => :comment_restore
end
