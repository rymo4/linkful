Linkful::Application.routes.draw do
  resources :links
  resources :bookmarklinks

  match '/links/create' => 'links#create'

  match 'bookmarklet/:userid' => 'links#bookmarklet'
  match 'bookmarklet_iframe/:userid' => 'links#bookmarklet_iframe'
  match 'bookmark' => 'home#bookmark', :as => :bookmark

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
end
