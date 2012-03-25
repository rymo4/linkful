Linkful::Application.routes.draw do
  resources :links

  match '/links/create' => 'links#create'

  match 'bookmarklet/:userid' => 'links#bookmarklet'
  match 'bookmark' => 'home#bookmark', :as => :bookmark
  match 'test' => 'home#test'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
end
