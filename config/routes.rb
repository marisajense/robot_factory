Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :inventors do
    resources :robots
  end

  resources :robots do
    resources :parts
  end
  
end