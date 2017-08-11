Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]
  resources :sound_groups, :only => [:index, :show, :new, :create]
  get '/sound_groups/:id/play', to: 'sound_groups#play'
  resources :tracks, :only => [:create, :destroy]
end
