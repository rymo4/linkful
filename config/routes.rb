Linkful::Application.routes.draw do
  resources :links
  resources :bookmarklinks

  match '/links/create' => 'links#create'

  match 'bookmarklet/:userid' => 'bookmarklinks#bookmarklet'
  match 'bookmark' => 'home#bookmark', :as => :bookmark

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :except => :show
  match 'users/:profile_hash' => "users#show", :as => 'user'
end
