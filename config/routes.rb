Rails.application.routes.draw do
  resources :advertizements
  
  resources :posts

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
